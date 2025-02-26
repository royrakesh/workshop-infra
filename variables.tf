
variable "region" {
  description = "The region of the OCI resource"
  type = string
}

variable "auth" {
  description = "The authorization type of the OCI resource"
  type = string
}

variable "config_file_profile" {
  type = string
}

variable "compartment_id" {
  description = "The OCID of the compartment where resources will be created"
  type        = string
}

variable "app_name" {
  description = "The Application name"
  type = string
}

variable "environment" {
  description = "Current environment"
  type = string
  default = "development"
}

variable "vcn_cidr" {
  description = "CIDR block for VCN"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}
