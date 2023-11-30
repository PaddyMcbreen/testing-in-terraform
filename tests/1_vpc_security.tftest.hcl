
run "security_added_to_vpc" {
  assert {
    condition     = module.security.ingress_control.vpc_id == module.vpc.vpc_id
    error_message = "Ingress Control SG not added to VPC"
  }

#   assert {
#     condition     = module.security.egress_control.vpc_id == module.vpc.vpc_id
#     error_message = "Egress Control SG not added to VPC"
#   }

}
