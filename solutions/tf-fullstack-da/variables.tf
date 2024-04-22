##############################################################################
# Input variables
##############################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The API Key to use for IBM Cloud."
  sensitive   = true
}

variable "prefix" {
  type        = string
  description = "(Optional) Prefix to append to all resources created by this solution."
  default     = null
}

variable "use_existing_resource_group" {
  type        = bool
  description = "Whether to use an existing resource group."
  default     = false
}

variable "resource_group_name" {
  type        = string
  description = "The name of a new or an existing resource group in which to provision resources to. If prefix input variable is passed then it will get prefixed infront of the value in the format of '<prefix>-value'."
}

variable "cos_instance_name" {
  type        = string
  default     = "cos-instance"
  description = "The name to use when creating the Cloud Object Storage instance. If prefix input variable is passed then it will get prefixed infront of the value in the format of '<prefix>-value'."
}

variable "cos_source_bucket_name" {
  type        = string
  default     = "source-bucket"
  description = "The name to use when creating the source Cloud Object Storage bucket (NOTE: bucket names are globally unique). If 'add_bucket_name_suffix' is set to true, a random 4 characters will be added to this name to help ensure bucket name is globally unique. If prefix input variable is passed then it will get prefixed infront of the value in the format of '<prefix>-value'."
}

variable "cos_source_bucket_region" {
  type        = string
  default     = "us-south"
  description = "The region to provision the source Cloud Object Storage bucket."
}

variable "cos_target_bucket_name" {
  type        = string
  default     = "target-bucket"
  description = "The name to use when creating the target Cloud Object Storage bucket (NOTE: bucket names are globally unique). If 'add_bucket_name_suffix' is set to true, a random 4 characters will be added to this name to help ensure bucket name is globally unique. If prefix input variable is passed then it will get prefixed infront of the value in the format of '<prefix>-value'."
}

variable "cos_target_bucket_region" {
  type        = string
  default     = "us-east"
  description = "The region to provision the target Cloud Object Storage bucket."
}

variable "add_bucket_name_suffix" {
  type        = bool
  description = "Add random generated suffix (4 characters long) to the COS bucket names. Set to false if you want full control over bucket naming using the 'cos_source_bucket_name' and 'cos_target_bucket_name' variables."
  default     = true
}
