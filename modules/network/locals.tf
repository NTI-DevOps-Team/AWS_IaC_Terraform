locals {
  public_subnet = {
    for k, v in var.subnets : k => v if v.public_ip
  }

  private_subnet = {
    for k, v in var.subnets : k => v if !v.public_ip
  }
}

locals {
  inbound_rules = {
    for sg_key, sg_value in var.sg : sg_key => sg_value.inbound_rules
  }

  outbound_rules = {
    for sg_key, sg_value in var.sg : sg_key => sg_value.outbound_rules
  }
}
