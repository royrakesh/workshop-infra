terraform {
  required_version = ">= 0.15.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.21.0"
    }
  }
}