output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}
output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.vpc.cidr_block

}

output "subnet_ids" {
  description = "The IDs of the created subnets"
  value = {
    for k, s in aws_subnet.subnets : k => s.id
  }
}


