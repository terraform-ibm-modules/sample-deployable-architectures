# Terraform based "fullstack" sample deployable architecture - COS bucket replication

This architecture supports provisioning the following resources:
- Resource group (also support using existing resource group)
- A global Cloud Object Storage instance
- An primary source Object Storage bucket in a given region
- An target Object Storage bucket where data will be replicated to
- A replication rule to replicate everything from the source bucket to the target bucket
- An IAM authorization policy required for the replication between the buckets

![observability-instances-deployable-architecture](../../reference-architecture/deployable-architecture-observability-instances.svg)

**NB:** This solution is not intended to be called by one or more other modules since it contains a provider configurations, meaning it is not compatible with the `for_each`, `count`, and `depends_on` arguments. For more information see [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers)

<!-- Below content is automatically populated via pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, <1.7.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.64.2 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cos_buckets"></a> [cos\_buckets](#module\_cos\_buckets) | terraform-ibm-modules/cos/ibm//modules/buckets | 8.1.10 |
| <a name="module_cos_instance"></a> [cos\_instance](#module\_cos\_instance) | terraform-ibm-modules/cos/ibm | 8.1.10 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | terraform-ibm-modules/resource-group/ibm | 1.1.4 |

### Resources

| Name | Type |
|------|------|
| [ibm_cos_bucket_replication_rule.cos_replication_rule](https://registry.terraform.io/providers/ibm-cloud/ibm/1.64.2/docs/resources/cos_bucket_replication_rule) | resource |
| [ibm_iam_authorization_policy.policy](https://registry.terraform.io/providers/ibm-cloud/ibm/1.64.2/docs/resources/iam_authorization_policy) | resource |
| [ibm_iam_account_settings.iam_account_settings](https://registry.terraform.io/providers/ibm-cloud/ibm/1.64.2/docs/data-sources/iam_account_settings) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_bucket_name_suffix"></a> [add\_bucket\_name\_suffix](#input\_add\_bucket\_name\_suffix) | Add random generated suffix (4 characters long) to the COS bucket names. Set to false if you want full control over bucket naming using the 'cos\_source\_bucket\_name' and 'cos\_target\_bucket\_name' variables. | `bool` | `true` | no |
| <a name="input_cos_instance_name"></a> [cos\_instance\_name](#input\_cos\_instance\_name) | The name to use when creating the Cloud Object Storage instance. If prefix input variable is passed then it will get prefixed infront of the value in the format of '<prefix>-value'. | `string` | `"cos-instance"` | no |
| <a name="input_cos_source_bucket_name"></a> [cos\_source\_bucket\_name](#input\_cos\_source\_bucket\_name) | The name to use when creating the source Cloud Object Storage bucket (NOTE: bucket names are globally unique). If 'add\_bucket\_name\_suffix' is set to true, a random 4 characters will be added to this name to help ensure bucket name is globally unique. If prefix input variable is passed then it will get prefixed infront of the value in the format of '<prefix>-value'. | `string` | `"source-bucket"` | no |
| <a name="input_cos_source_bucket_region"></a> [cos\_source\_bucket\_region](#input\_cos\_source\_bucket\_region) | The region to provision the source Cloud Object Storage bucket. | `string` | `"us-south"` | no |
| <a name="input_cos_target_bucket_name"></a> [cos\_target\_bucket\_name](#input\_cos\_target\_bucket\_name) | The name to use when creating the target Cloud Object Storage bucket (NOTE: bucket names are globally unique). If 'add\_bucket\_name\_suffix' is set to true, a random 4 characters will be added to this name to help ensure bucket name is globally unique. If prefix input variable is passed then it will get prefixed infront of the value in the format of '<prefix>-value'. | `string` | `"target-bucket"` | no |
| <a name="input_cos_target_bucket_region"></a> [cos\_target\_bucket\_region](#input\_cos\_target\_bucket\_region) | The region to provision the target Cloud Object Storage bucket. | `string` | `"us-east"` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | The API Key to use for IBM Cloud. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Optional) Prefix to append to all resources created by this solution. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of a new or an existing resource group in which to provision resources to. If prefix input variable is passed then it will get prefixed infront of the value in the format of '<prefix>-value'. | `string` | n/a | yes |
| <a name="input_use_existing_resource_group"></a> [use\_existing\_resource\_group](#input\_use\_existing\_resource\_group) | Whether to use an existing resource group. | `bool` | `false` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_cos_instance_crn"></a> [cos\_instance\_crn](#output\_cos\_instance\_crn) | COS instance crn |
| <a name="output_cos_instance_guid"></a> [cos\_instance\_guid](#output\_cos\_instance\_guid) | COS instance guid |
| <a name="output_cos_instance_id"></a> [cos\_instance\_id](#output\_cos\_instance\_id) | COS instance id |
| <a name="output_cos_source_bucket_crn"></a> [cos\_source\_bucket\_crn](#output\_cos\_source\_bucket\_crn) | COS source bucket crn |
| <a name="output_cos_source_bucket_id"></a> [cos\_source\_bucket\_id](#output\_cos\_source\_bucket\_id) | COS source bucket id |
| <a name="output_cos_source_bucket_name"></a> [cos\_source\_bucket\_name](#output\_cos\_source\_bucket\_name) | COS source bucket name |
| <a name="output_cos_source_bucket_s3_endpoint_direct"></a> [cos\_source\_bucket\_s3\_endpoint\_direct](#output\_cos\_source\_bucket\_s3\_endpoint\_direct) | COS source direct endpoint |
| <a name="output_cos_source_bucket_s3_endpoint_private"></a> [cos\_source\_bucket\_s3\_endpoint\_private](#output\_cos\_source\_bucket\_s3\_endpoint\_private) | COS source private endpoint |
| <a name="output_cos_source_bucket_s3_endpoint_public"></a> [cos\_source\_bucket\_s3\_endpoint\_public](#output\_cos\_source\_bucket\_s3\_endpoint\_public) | COS source public endpoint |
| <a name="output_cos_target_bucket_crn"></a> [cos\_target\_bucket\_crn](#output\_cos\_target\_bucket\_crn) | COS target bucket crn |
| <a name="output_cos_target_bucket_id"></a> [cos\_target\_bucket\_id](#output\_cos\_target\_bucket\_id) | COS target bucket id |
| <a name="output_cos_target_bucket_name"></a> [cos\_target\_bucket\_name](#output\_cos\_target\_bucket\_name) | COS target bucket name |
| <a name="output_cos_target_bucket_s3_endpoint_direct"></a> [cos\_target\_bucket\_s3\_endpoint\_direct](#output\_cos\_target\_bucket\_s3\_endpoint\_direct) | COS target direct endpoint |
| <a name="output_cos_target_bucket_s3_endpoint_private"></a> [cos\_target\_bucket\_s3\_endpoint\_private](#output\_cos\_target\_bucket\_s3\_endpoint\_private) | COS target private endpoint |
| <a name="output_cos_target_bucket_s3_endpoint_public"></a> [cos\_target\_bucket\_s3\_endpoint\_public](#output\_cos\_target\_bucket\_s3\_endpoint\_public) | COS target public endpoint |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | Resource group ID |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->