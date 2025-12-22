##############################################################################
# Input variables
##############################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API key needed to deploy IAM-enabled resources."
  sensitive   = true
}

variable "provider_visibility" {
  description = "Set the visibility value for the IBM terraform provider. Supported values are `public`, `private`, `public-and-private`. [Learn more](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/guides/custom-service-endpoints)."
  type        = string
  # Defaulting this to public to workaround https://github.com/IBM-Cloud/terraform-provider-ibm/issues/5977
  default = "private"

  validation {
    condition     = contains(["public", "private", "public-and-private"], var.provider_visibility)
    error_message = "Invalid visibility option. Allowed values are 'public', 'private', or 'public-and-private'."
  }
}

variable "cos_instance_guid" {
  type        = string
  description = "The GUID of the Object Storage instance to configure."
}

variable "cos_bucket_name" {
  type        = string
  description = "The name of the Object Storage bucket to configure."
}

variable "cos_bucket_crn" {
  type        = string
  description = "The CRN of the Object Storage bucket to configure."
}

variable "cos_bucket_location" {
  type        = string
  description = "The location of the Object Storage bucket."
}

variable "error_document" {
  type        = string
  description = "The name of the HTML file that exists in the bucket to use when a static website bucket error occurs."
  default     = "error.html"
}

variable "index_document" {
  type        = string
  description = "The name of the HTML file that exists in the bucket to use as the home or default page of the website."
  default     = "index.html"
}
