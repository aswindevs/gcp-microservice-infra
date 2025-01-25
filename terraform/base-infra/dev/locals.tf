locals {
    project_id = "pocs-448717"
    region = "asia-south1"
    environment = "dev"
    project = "verloop"
    gke_master_ipv4_cidr_block = "10.40.8.0/28"
    tags = {
        environment = local.environment
        project = local.project
    }
    project_prefix = "${local.project}-${local.environment}"
}