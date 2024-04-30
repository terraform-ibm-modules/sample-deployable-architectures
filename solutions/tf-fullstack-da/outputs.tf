##############################################################################
# Outputs
##############################################################################

output "resource_group_name" {
  description = "Resource group name"
  value       = module.resource_group.resource_group_name
}

output "resource_group_id" {
  description = "Resource group ID"
  value       = module.resource_group.resource_group_id
}

output "cos_instance_id" {
  description = "COS instance id"
  value       = module.cos_instance.cos_instance_id
}

output "cos_instance_guid" {
  description = "COS instance guid"
  value       = module.cos_instance.cos_instance_guid
}

output "cos_instance_crn" {
  description = "Object Storage instance CRN"
  value       = module.cos_instance.cos_instance_crn
}

output "cos_source_bucket_name" {
  description = "COS source bucket name"
  value       = module.cos_buckets.buckets[local.cos_source_bucket_name].bucket_name
}

output "cos_source_bucket_id" {
  description = "COS source bucket id"
  value       = module.cos_buckets.buckets[local.cos_source_bucket_name].bucket_id
}

output "cos_source_bucket_crn" {
  description = "COS source bucket crn"
  value       = module.cos_buckets.buckets[local.cos_source_bucket_name].bucket_crn
}

output "cos_source_bucket_s3_endpoint_private" {
  description = "COS source private endpoint"
  value       = module.cos_buckets.buckets[local.cos_source_bucket_name].s3_endpoint_private
}

output "cos_source_bucket_s3_endpoint_public" {
  description = "COS source public endpoint"
  value       = module.cos_buckets.buckets[local.cos_source_bucket_name].s3_endpoint_public
}

output "cos_source_bucket_s3_endpoint_direct" {
  description = "COS source direct endpoint"
  value       = module.cos_buckets.buckets[local.cos_source_bucket_name].s3_endpoint_direct
}

output "cos_target_bucket_name" {
  description = "COS target bucket name"
  value       = module.cos_buckets.buckets[local.cos_target_bucket_name].bucket_name
}

output "cos_target_bucket_id" {
  description = "COS target bucket id"
  value       = module.cos_buckets.buckets[local.cos_target_bucket_name].bucket_id
}

output "cos_target_bucket_crn" {
  description = "COS target bucket crn"
  value       = module.cos_buckets.buckets[local.cos_target_bucket_name].bucket_crn
}

output "cos_target_bucket_s3_endpoint_private" {
  description = "COS target private endpoint"
  value       = module.cos_buckets.buckets[local.cos_target_bucket_name].s3_endpoint_private
}

output "cos_target_bucket_s3_endpoint_public" {
  description = "COS target public endpoint"
  value       = module.cos_buckets.buckets[local.cos_target_bucket_name].s3_endpoint_public
}

output "cos_target_bucket_s3_endpoint_direct" {
  description = "COS target direct endpoint"
  value       = module.cos_buckets.buckets[local.cos_target_bucket_name].s3_endpoint_direct
}
