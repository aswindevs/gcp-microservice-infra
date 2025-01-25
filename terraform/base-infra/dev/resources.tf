
module "vpc" {
  source      = "../modules/vpc-global"
  proj_prefix = local.project_prefix
  region      = local.region
}


module "firewall" {
  source      = "../modules/firewall"
  proj_prefix = local.project_prefix
  network     = module.vpc.network
}


module "gke" {
  source                 = "../modules/gke-cluster"
  proj_prefix            = local.project_prefix
  environment            = local.environment
  region                 = local.region
  vpc                    = module.vpc.network
  master_ipv4_cidr_block = local.gke_master_ipv4_cidr_block
  location_zonal_type    = true
}


module "gke_nodepool_spot_2_8" {
  source                       = "../modules/gke-node-pool"
  proj_prefix                  = local.project_prefix
  environment                  = local.environment
  cluster_name                 = module.gke.cluster_name
  cluster_location             = module.gke.cluster_location
  google_service_account_email = module.gke.google_service_account_email
  node_pool_name               = "spot-2-8"
  preemptible_node             = false
  spot_node                    = true
  node_pool_min_node_count     = 0
  node_pool_max_node_count     = 20
  node_pool_machine_type       = "e2-standard-2"
  node_pool_root_disk_size     = "30"
  auto_upgrade                 = true
}



# module "gar" {
#   source        = "../modules/gar"
#   region        = local.region
#   repository_id = local.project_prefix

# }
