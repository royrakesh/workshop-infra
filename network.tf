
resource "oci_core_vcn" "main" {
  compartment_id =  var.compartment_id
  cidr_block     =  var.vcn_cidr
  display_name   = "${var.app_name}-${var.environment}-vcn"
  dns_label      = "${var.app_name}${var.environment}vcn"
}


resource "oci_core_internet_gateway" "main" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.app_name}-${var.environment}-internet-gateway"
}


resource "oci_core_nat_gateway" "main" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.app_name}-${var.environment}-nat-gateway"
}


# resource "oci_core_subnet" "public" {
#   compartment_id = var.compartment_id
#   vcn_id         = oci_core_vcn.main.id
#   cidr_block     = var.public_subnet_cidr
#   display_name   = "${var.app_name}-${var.environment}-public-subnet"
#   dns_label      = "${var.app_name}${var.environment}public"
  
#   security_list_ids = [oci_core_security_list.public.id]
#   route_table_id    = oci_core_route_table.public.id
# }


# resource "oci_core_subnet" "private" {
#   compartment_id = var.compartment_id
#   vcn_id         = oci_core_vcn.main.id
#   cidr_block     = var.private_subnet_cidr
#   display_name   = "${var.app_name}-${var.environment}-private-subnet"
#   dns_label      = "${var.app_name}${var.environment}private"
#   prohibit_public_ip_on_vnic = true
  
#   security_list_ids = [oci_core_security_list.private.id]
#   route_table_id    = oci_core_route_table.private.id
# }



# resource "oci_core_route_table" "public" {
#   compartment_id = var.compartment_id
#   vcn_id         = oci_core_vcn.main.id
#   display_name   = "${var.app_name}-${var.environment}-public-route-table"

#   route_rules {
#     destination       = "0.0.0.0/0"
#     network_entity_id = oci_core_internet_gateway.main.id
#   }
# }


# resource "oci_core_route_table" "private" {
#   compartment_id = var.compartment_id
#   vcn_id         = oci_core_vcn.main.id
#   display_name   = "${var.app_name}-${var.environment}-private-route-table"

#   route_rules {
#     destination       = "0.0.0.0/0"
#     network_entity_id = oci_core_nat_gateway.main.id
#   }
# }


# resource "oci_core_security_list" "public" {
#   compartment_id = var.compartment_id
#   vcn_id         = oci_core_vcn.main.id
#   display_name   = "${var.app_name}-${var.environment}-public-security-list"

#   ingress_security_rules {
#     protocol = "6" # TCP
#     source   = "0.0.0.0/0"
    
#     tcp_options {
#       min = 80
#       max = 80
#     }
#   }

#   ingress_security_rules {
#     protocol = "6" # TCP
#     source   = "0.0.0.0/0"
    
#     tcp_options {
#       min = 81
#       max = 81
#     }
#   }

#   ingress_security_rules {
#     protocol = "6" # TCP
#     source   = "0.0.0.0/0"
    
#     tcp_options {
#       min = 443
#       max = 443
#     }
#   }

#   egress_security_rules {
#     protocol    = "all"
#     destination = "0.0.0.0/0"
#   }
# }


# resource "oci_core_security_list" "private" {
#   compartment_id = var.compartment_id
#   vcn_id         = oci_core_vcn.main.id
#   display_name   = "${var.app_name}-${var.environment}-private-security-list"

#   ingress_security_rules {
#     protocol = "6" # TCP
#     source   = var.public_subnet_cidr
    
#     tcp_options {
#       min = 22
#       max = 22
#     }
#   }

#   ingress_security_rules {
#     protocol = "6" # TCP
#     source   = var.public_subnet_cidr
    
#     tcp_options {
#       min = 80
#       max = 80
#     }
#   }

#   egress_security_rules {
#     protocol    = "all"
#     destination = "0.0.0.0/0"
#   }
# }