<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_container_node_pool.pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_repair"></a> [auto\_repair](#input\_auto\_repair) | auto\_repair | `bool` | `true` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | auto\_upgrade | `bool` | `true` | no |
| <a name="input_cluster_location"></a> [cluster\_location](#input\_cluster\_location) | The cluster location | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of cluster. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the envionment | `string` | n/a | yes |
| <a name="input_ephemeral_storage_local_ssd_count"></a> [ephemeral\_storage\_local\_ssd\_count](#input\_ephemeral\_storage\_local\_ssd\_count) | ephemeral\_storage\_local\_ssd\_config | `number` | `null` | no |
| <a name="input_google_service_account_email"></a> [google\_service\_account\_email](#input\_google\_service\_account\_email) | Email of the service account. | `any` | n/a | yes |
| <a name="input_gpu"></a> [gpu](#input\_gpu) | GPU configuration | <pre>object({<br>    enabled = bool<br>    gpu_sharing = optional(object({<br>      strategy             = optional(string, "MPS")<br>      max_clients_per_node = optional(number, 2)<br>    }))<br>  })</pre> | <pre>{<br>  "enabled": false,<br>  "gpu_sharing": {<br>    "max_clients_per_node": 2,<br>    "strategy": "MPS"<br>  }<br>}</pre> | no |
| <a name="input_gpu_amount"></a> [gpu\_amount](#input\_gpu\_amount) | gpu\_amount | `number` | `1` | no |
| <a name="input_gpu_driver_version"></a> [gpu\_driver\_version](#input\_gpu\_driver\_version) | gpu\_driver\_version | `string` | `"LATEST"` | no |
| <a name="input_gpu_type"></a> [gpu\_type](#input\_gpu\_type) | gpu\_type | `string` | `"nvidia-l4"` | no |
| <a name="input_node_locations"></a> [node\_locations](#input\_node\_locations) | (Optional) The list of zones in which the node pool's nodes should be located. Nodes must be in the region of their regional cluster or in the same region as their cluster's zone for zonal clusters. If unspecified, the cluster-level node\_locations will be used. | `list(string)` | `null` | no |
| <a name="input_node_pool_machine_type"></a> [node\_pool\_machine\_type](#input\_node\_pool\_machine\_type) | Type of the node compute engines. | `string` | `"e2-medium"` | no |
| <a name="input_node_pool_max_node_count"></a> [node\_pool\_max\_node\_count](#input\_node\_pool\_max\_node\_count) | Maximum number of nodes in the NodePool. Must be >= min\_node\_count. | `number` | n/a | yes |
| <a name="input_node_pool_min_node_count"></a> [node\_pool\_min\_node\_count](#input\_node\_pool\_min\_node\_count) | Minimum number of nodes in the NodePool. Must be >=0 and <= max\_node\_count. | `number` | n/a | yes |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | node\_pool\_name. | `any` | n/a | yes |
| <a name="input_node_pool_network_tags"></a> [node\_pool\_network\_tags](#input\_node\_pool\_network\_tags) | Network tags that need to be added to the Node | `list` | <pre>[<br>  "private"<br>]</pre> | no |
| <a name="input_node_pool_root_disk_size"></a> [node\_pool\_root\_disk\_size](#input\_node\_pool\_root\_disk\_size) | Node disk size (Gb) | `number` | `30` | no |
| <a name="input_override"></a> [override](#input\_override) | override | `map` | `{}` | no |
| <a name="input_preemptible_node"></a> [preemptible\_node](#input\_preemptible\_node) | Enable Preempitble node type | `bool` | `false` | no |
| <a name="input_proj_prefix"></a> [proj\_prefix](#input\_proj\_prefix) | The name of the project. | `string` | n/a | yes |
| <a name="input_spot_node"></a> [spot\_node](#input\_spot\_node) | Enable Spot node type | `bool` | `false` | no |
| <a name="input_taint"></a> [taint](#input\_taint) | taint | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_node_pool_name"></a> [node\_pool\_name](#output\_node\_pool\_name) | n/a |
<!-- END_TF_DOCS -->