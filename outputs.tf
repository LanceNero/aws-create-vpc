output "output_vpc_id" {
    description = "The VPC ID of the VPC"
    value = try(aws_vpc.this[0].id,var.vpc_id)
}

output "output_vpc_arn" {
    description = "The VPC ARN of the VPC"
    value = try(aws_vpc.this[0].arn,data.aws_vpc.exists_vpc[0].arn)
} 

output "output_vpc_cidr_block" {
    description = "CIDR blocks of VPC"
    value = try(aws_vpc.this[0].cidr_block,data.aws_vpc.exists_vpc[0].cidr_block)
}
