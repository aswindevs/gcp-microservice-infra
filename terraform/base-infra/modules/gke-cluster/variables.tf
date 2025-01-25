variable "proj_prefix" {
  type = string
  description = "The name of the project."
}

variable "region" {
  type = string
  description = "The name of the region where the cluster need to be created."
}

variable "location_zonal_type" {
  type = string
  description = "Whether the cluster type is zonal"
  default = false
}

variable "zone" {
  type = string
  description = "The name of the region zone where the cluster need to be created. (for zonal cluster type)"
  default = null
}

variable "environment" {
  type = string
  description = "The name of the envionment"
}

variable "vpc" {
  type        = string
  description = "The name of the vpc for the cluster."
}

variable "subnetwork" {
  description = "The name of the subnetwork for the cluster."
  default = null
}


variable "master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation where the control plane needs to reside, /26 required"
}

variable "channel_type" {
  description = "cluster channel type."
  default = "UNSPECIFIED"
}

variable "min_master_version" {
  description = "min_master_version"
  default = null
}

variable "image_streaming" {
  type = bool
  description = "Whether cluster use image streaming"
  default = false
}
variable "enable_gcp_filestore_csi_driver_config" {
  description = "enable_gcp_filestore_csi_driver_config"
  default = false
}