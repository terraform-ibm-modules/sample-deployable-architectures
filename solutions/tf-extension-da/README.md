# Terraform based "extension" sample deployable architecture - Serving static websites with IBM Cloud Object Storage

This architecture supports extending an existing Object Storage bucket with the configuration required to host a static website. The solution will configure the following things:
- enables public access for the provided Object Storage bucket
- adds the website configuration to host a static website

![cos-website](../../reference-architectures/cos-website.svg)

:exclamation: This solution is not intended to be called by one or more other modules since they contain provider configurations, meaning they are not compatible with the `for_each`, `count`, and `depends_on` arguments. For more information see [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers)

<!-- Below content is automatically populated via pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, <1.7.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.64.2 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_cos_bucket_website_configuration.website](https://registry.terraform.io/providers/ibm-cloud/ibm/1.64.2/docs/resources/cos_bucket_website_configuration) | resource |
| [ibm_iam_access_group_policy.policy](https://registry.terraform.io/providers/ibm-cloud/ibm/1.64.2/docs/resources/iam_access_group_policy) | resource |
| [ibm_cos_bucket.bucket](https://registry.terraform.io/providers/ibm-cloud/ibm/1.64.2/docs/data-sources/cos_bucket) | data source |
| [ibm_iam_access_group.public_access_group](https://registry.terraform.io/providers/ibm-cloud/ibm/1.64.2/docs/data-sources/iam_access_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cos_bucket_name"></a> [cos\_bucket\_name](#input\_cos\_bucket\_name) | The name of the Object storsage bucket to configure. | `string` | n/a | yes |
| <a name="input_cos_bucket_region"></a> [cos\_bucket\_region](#input\_cos\_bucket\_region) | The region of the Object Storage bucket. | `string` | n/a | yes |
| <a name="input_cos_instance_crn"></a> [cos\_instance\_crn](#input\_cos\_instance\_crn) | The Object Storage instance CRN in which the bucket exists | `string` | n/a | yes |
| <a name="input_error_document"></a> [error\_document](#input\_error\_document) | The name of the HTML file that exists in the bucket to use when a static website bucket error occurs. | `string` | n/a | yes |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | The API Key to use for IBM Cloud. | `string` | n/a | yes |
| <a name="input_index_document"></a> [index\_document](#input\_index\_document) | The name of the HTML file that exists in the bucket to use as the home or default page of the website. | `string` | n/a | yes |

### Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
