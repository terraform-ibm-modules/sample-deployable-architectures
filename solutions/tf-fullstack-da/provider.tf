########################################################################################################################
# Provider config
########################################################################################################################

provider "ibm" {
  ibmcloud_api_key      = var.ibmcloud_api_key
  visibility            = var.provider_visibility
  private_endpoint_type = (var.provider_visibility == "private" && var.cos_source_bucket_region == "ca-mon") ? "vpe" : null
}
