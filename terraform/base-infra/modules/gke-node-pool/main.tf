
resource "google_container_node_pool" "pool" {

  cluster  = var.cluster_name
  location = var.cluster_location

  name               = var.node_pool_name
  node_locations     = var.node_locations
  max_pods_per_node  = 50
  initial_node_count = 1
  autoscaling {
    min_node_count = var.node_pool_min_node_count
    max_node_count = var.node_pool_max_node_count
  }

  node_config {
    preemptible  = var.preemptible_node
    spot         = var.spot_node
    machine_type = var.node_pool_machine_type
    disk_size_gb = var.node_pool_root_disk_size
    tags         = var.node_pool_network_tags

    #Service Account
    service_account = var.google_service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      env       = var.environment
      type      = "managed"
      role      = "worker"
      pool      = try(var.override["labels_pool"], var.node_pool_name)
      gpu_count = var.gpu.enabled ? var.gpu_amount : 0
    }

    # For accessing Google API : https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity#enable_on_cluster
    workload_metadata_config {
      mode = "GKE_METADATA"
    }
    dynamic "guest_accelerator" {
      for_each = var.gpu.enabled ? [1] : []
      content {
        type  = var.gpu_type
        count = var.gpu_amount
        gpu_driver_installation_config {
          gpu_driver_version = var.gpu_driver_version
        }
        dynamic "gpu_sharing_config" {
          for_each = var.gpu.gpu_sharing != null ? [1] : []
          content {
            gpu_sharing_strategy       = var.gpu.gpu_sharing.strategy
            max_shared_clients_per_gpu = var.gpu.gpu_sharing.max_clients_per_node
          }
        }
      }
    }
    dynamic "taint" {
      for_each = var.taint
      content {
        key    = taint.key
        value  = taint.value
        effect = "NO_SCHEDULE"
      }
    }

    dynamic "ephemeral_storage_local_ssd_config" {
      for_each = var.ephemeral_storage_local_ssd_count != null ? [1] : []
      content {
        local_ssd_count   = var.ephemeral_storage_local_ssd_count
      }
    }
  }

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }

  upgrade_settings {
    max_surge       = 2
    max_unavailable = 0
  }

  lifecycle {
    ignore_changes = [initial_node_count, autoscaling, node_config[0].metadata , node_config[0].kubelet_config]
  }
}
