<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_container_cluster.main](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_cluster) | resource |
| [google_project_iam_member.sa_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.node](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_channel_type"></a> [channel\_type](#input\_channel\_type) | cluster channel type. | `string` | `"UNSPECIFIED"` | no |
| <a name="input_enable_gcp_filestore_csi_driver_config"></a> [enable\_gcp\_filestore\_csi\_driver\_config](#input\_enable\_gcp\_filestore\_csi\_driver\_config) | enable\_gcp\_filestore\_csi\_driver\_config | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the envionment | `string` | n/a | yes |
| <a name="input_image_streaming"></a> [image\_streaming](#input\_image\_streaming) | Whether cluster use image streaming | `bool` | `false` | no |
| <a name="input_location_zonal_type"></a> [location\_zonal\_type](#input\_location\_zonal\_type) | Whether the cluster type is zonal | `string` | `false` | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | The IP range in CIDR notation where the control plane needs to reside, /26 required | `any` | n/a | yes |
| <a name="input_min_master_version"></a> [min\_master\_version](#input\_min\_master\_version) | min\_master\_version | `any` | `null` | no |
| <a name="input_proj_prefix"></a> [proj\_prefix](#input\_proj\_prefix) | The name of the project. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The name of the region where the cluster need to be created. | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The name of the subnetwork for the cluster. | `any` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | The name of the vpc for the cluster. | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The name of the region zone where the cluster need to be created. (for zonal cluster type) | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_location"></a> [cluster\_location](#output\_cluster\_location) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_google_service_account_email"></a> [google\_service\_account\_email](#output\_google\_service\_account\_email) | n/a |
<!-- END_TF_DOCS -->