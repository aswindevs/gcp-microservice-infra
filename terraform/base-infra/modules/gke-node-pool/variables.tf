variable "proj_prefix" {
  type        = string
  description = "The name of the project."
}

variable "cluster_name" {
  type        = string
  description = "The name of cluster."
}

variable "cluster_location" {
  type        = string
  description = "The cluster location"
}

variable "environment" {
  type        = string
  description = "The name of the envionment"
}

variable "node_locations" {
  type        = list(string)
  description = "(Optional) The list of zones in which the node pool's nodes should be located. Nodes must be in the region of their regional cluster or in the same region as their cluster's zone for zonal clusters. If unspecified, the cluster-level node_locations will be used."
  default     = null
}

variable "node_pool_machine_type" {
  type        = string
  description = "Type of the node compute engines."
  default     = "e2-medium"
}

variable "node_pool_root_disk_size" {
  type        = number
  description = "Node disk size (Gb)"
  default     = 30
}

variable "node_pool_network_tags" {
  description = "Network tags that need to be added to the Node"
  default     = ["private"]
}

variable "node_pool_min_node_count" {
  type        = number
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
}

variable "node_pool_max_node_count" {
  type        = number
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
}

variable "preemptible_node" {
  description = "Enable Preempitble node type"
  type        = bool
  default     = false
}

variable "spot_node" {
  description = "Enable Spot node type"
  type        = bool
  default     = false
}

variable "google_service_account_email" {
  description = "Email of the service account."
}

variable "node_pool_name" {
  description = "node_pool_name."
}

#https://cloud.google.com/kubernetes-engine/docs/how-to/gpus#terraform
variable "gpu_type" {
  description = "gpu_type"
  default     = "nvidia-l4"
}

variable "gpu_driver_version" {
  description = "gpu_driver_version"
  default     = "LATEST"
}
variable "gpu_amount" {
  description = "gpu_amount"
  default     = 1
}

variable "gpu" {
  description = "GPU configuration"
  type = object({
    enabled = bool
    gpu_sharing = optional(object({
      strategy             = optional(string, "MPS")
      max_clients_per_node = optional(number, 2)
    }))
  })
  default = {
    enabled = false
    gpu_sharing = {
      strategy             = "MPS"
      max_clients_per_node = 2
    }
  }
}

variable "taint" {
  description = "taint"
  default     = {}
}

variable "auto_repair" {
  description = "auto_repair"
  default     = true

}

variable "auto_upgrade" {
  description = "auto_upgrade"
  default     = true
}


variable "override" {
  description = "override"
  default     = {}
}

variable "ephemeral_storage_local_ssd_count" {
  description = "ephemeral_storage_local_ssd_config"
  type        = number
  default     = null

}
