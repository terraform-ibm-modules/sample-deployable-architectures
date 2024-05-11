terraform {
  required_version = ">= 1.3.0, <1.7.0"
  required_providers {
    # Lock deployable architecture into an exact provider version - renovate automation will keep it updated
    ibm = {
      source  = "ibm-cloud/ibm"
      version = "1.65.0"
    }
  }
}
