variable "aws_region" {
  description = "Set the target AWS area for the current resource creation"
  type = string
  default = "cn-northwest-1"

# validation {
#     ## Terrform doesn't support this syntax, it only support refer to itself
#     #condition     = contains(data.aws_regions.current.names,lower(var.aws_region))
#     error_message = "The aws region value must in list of aws regions, current value: ${var.aws_region}"
#   }
}

################################################################################
# VPC
################################################################################

variable "vpc_name" {
    type = string
    description = "(optional) set a name to vpc"
    default = ""    
}

variable "vpc_id" {
  description = <<EOT
    (optional) If you have an exists VPC, you can specifying exists vpc id to this variable, value e.g.:vpc-05f04f4c0fees123f
    if you set this variable, this module will not create a new vpc, but you can using this vpc id to create more subnet
  EOT
  type        = string
  default = ""
}

variable "vpc_ipv4_cidr" {
  description = "(optional) VPC IPv4 CIDR , default value: 10.1.0.0/16"
  type        = string
  default = "10.1.0.0/16"
  
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}($|/([0-9]{1,2}))$", var.vpc_ipv4_cidr))
    error_message = "Vpc_cidr value must match this style 0.0.0.0/0."
  }
}

variable "enable_dns_support" {
  type = bool
  description = "(Optional) A boolean flag to enable/disable DNS support in the VPC. Defaults to true."

  default = true
}

variable "enable_dns_hostnames" {
  type = bool
  description = "(Optional) A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
  default = true
}

# #using attribute names could getting all region names of current aws partition(aws,aws-cn)
# data "aws_regions" "current" {
#   all_regions = true
# } 

variable "vpc_instance_tenancy" {
  description = "Set the target AWS area for the current resource creation"
  type = string
  ## Option: default | dedicated
  default = "default"
}

################################################################################
# Common Variables
################################################################################

variable "common_tags" {
  description = "The tag set to all resources creation of this module "
  type = map(string)
  default = {
    creator = "Nero"
    creatioin_tool = "Terraform"
  }

}