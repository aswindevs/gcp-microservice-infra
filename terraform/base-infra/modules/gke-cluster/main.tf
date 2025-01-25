locals {
  zone     = var.zone == null ? data.google_compute_zones.available.names[0] : var.zone
  location = var.location_zonal_type ? local.zone : var.region
}

data "google_compute_zones" "available" {
  region = var.region
}

data "google_project" "project" {
}

resource "google_container_cluster" "main" {
  provider = google-beta
  name       = "${var.proj_prefix}-gke-cluster"
  location   = local.location
  network    = var.vpc
  subnetwork = var.subnetwork

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = var.channel_type
  }
  monitoring_config {
    managed_prometheus {
      enabled = false
    }
  }

  resource_labels = {
    env = var.environment
  }

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
    http_load_balancing {
      disabled = false
    }
    gcp_filestore_csi_driver_config {
      enabled = var.enable_gcp_filestore_csi_driver_config
    }
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }
  }

  networking_mode = "VPC_NATIVE"
  ip_allocation_policy {} #Automatically creates secondary subnets

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block #cidrsubnet(var.master_ipv4_cidr_block,4,0) # to make cidr /26
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "20:00"
    }
  }

  enable_shielded_nodes = true

  # For accessing Google API
  workload_identity_config {
    workload_pool = "${data.google_project.project.project_id}.svc.id.goog"
  }
  min_master_version = var.min_master_version

  dynamic "node_pool_defaults" {
    for_each = var.image_streaming ? [1] : []
    content {
      node_config_defaults {
        gcfs_config {
          enabled = true
        }
      }
    }
  }
}

resource "google_service_account" "node" {
  account_id   = google_container_cluster.main.name
  display_name = google_container_cluster.main.name
}

resource "google_project_iam_member" "sa_role" {
  for_each = toset(["roles/artifactregistry.reader", "roles/logging.logWriter", "roles/monitoring.metricWriter"])

  project = data.google_project.project.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.node.email}"
}
