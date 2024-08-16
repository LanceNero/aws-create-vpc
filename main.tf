locals {
  date = timestamp()
}

################################################################################
# VPC
################################################################################

data "aws_vpc" "exists_vpc" {
  count = length(var.vpc_id)>0 ? 1 : 0
  id = var.vpc_id
}

resource "aws_vpc" "this" {
  count = length(var.vpc_id) > 0 ? 0 : 1

  cidr_block    = var.vpc_ipv4_cidr

  instance_tenancy               = var.vpc_instance_tenancy
  enable_dns_support             = var.enable_dns_support
  enable_dns_hostnames           = var.enable_dns_hostnames

  tags = merge(
    { 
        "Name" = coalesce(var.vpc_name,"default_vpc") 
    },
    var.common_tags
  )
}

################################################################################
# Test
################################################################################

# resource "null_resource" "testfunc" {

#     provisioner "local-exec" {
#         command = "echo ${ var.aws_region }"
#     }
  
# }