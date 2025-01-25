provider "google" {
  project        = local.project_id
  region         = local.region
  credentials    = file("creds.json")
  default_labels = local.tags
}

provider "google-beta" {
  project        = local.project_id
  region         = local.region
  credentials    = file("creds.json")
  default_labels = local.tags
}

terraform {
  backend "gcs" {
    bucket = "poc-terrafrom-state"
    prefix = "base-infra/dev"
  }

  required_providers {
    ## edition field for spanner is available from 6.2.0
    google = {
      source  = "hashicorp/google"
      version = "6.6.0"
    }
  }
}
