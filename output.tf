output "network_configuration" {
  description = "Summary of network configuration"
  value = {
    vpc_id                = module.network.vpc_id
    vpc_cidr              = module.network.vpc_cidr
    availability_zones    = distinct([for k, v in var.subnets : v.az_name])
    public_subnets_count  = length([for k, v in var.subnets : k if v.public_ip])
    private_subnets_count = length([for k, v in var.subnets : k if !v.public_ip])
  }
}
