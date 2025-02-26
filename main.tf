provider "oci" {
  region              = var.region
  auth                = var.auth
  config_file_profile = var.config_file_profile
}


# Data Example

# data "oci_identity_availability_domains" "ads" {
#   compartment_id = var.compartment_id
# }
# ${lookup(data.oci_identity_availability_domains.ads.availability_domains[var.nat_instance_ad],"name")}