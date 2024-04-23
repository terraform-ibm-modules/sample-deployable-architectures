##############################################################################
# Outputs
##############################################################################

output "access_group_id" {
  description = "Resource group name"
  value       = ibm_iam_access_group_policy.policy.access_group_id
}

output "website_endpoint" {
  description = "Resource group name"
  value       = ibm_cos_bucket_website_configuration.website.website_endpoint
}
