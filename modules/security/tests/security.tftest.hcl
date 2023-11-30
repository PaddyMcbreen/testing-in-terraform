run "allow_http_ingress" {


  assert {
    condition     = aws_security_group_rule.allow_http_ingress.type == "ingress"
    error_message = "Type not set to ingress"
  }

  assert {
    condition     = aws_security_group_rule.allow_http_ingress.cidr_blocks[0] == "0.0.0.0/0"
    error_message = "Does not allow all IPv4 origins for HTTP"
  }

  assert {
    condition     = aws_security_group_rule.allow_http_ingress.ipv6_cidr_blocks[0] == "::/0"
    error_message = "Does not allow all IPv6 origins for HTTP"
  }

  assert {
    condition     = aws_security_group_rule.allow_http_ingress.from_port == 80 && aws_security_group_rule.allow_http_ingress.to_port == 80
    error_message = "Port Forwarding for HTTP not set up"
  }

  assert {
    condition     = aws_security_group_rule.allow_http_ingress.security_group_id == aws_security_group.ingress_control.id
    error_message = "HTTP ingress rule not added to the correct group"
  }

  assert {
    condition     = aws_security_group_rule.allow_http_ingress.protocol == "tcp"
    error_message = "Rule not accepting the correct protocol"
  }


}


run "allow_https_ingress" {


  assert {
    condition     = aws_security_group_rule.allow_https_ingress.type == "ingress"
    error_message = "Type not set to ingress"
  }

  assert {
    condition     = aws_security_group_rule.allow_https_ingress.cidr_blocks[0] == "0.0.0.0/0"
    error_message = "Does not allow all IPv4 origins for HTTPS"
  }

  assert {
    condition     = aws_security_group_rule.allow_https_ingress.ipv6_cidr_blocks[0] == "::/0"
    error_message = "Does not allow all IPv6 origins for HTTPS"
  }

  assert {
    condition     = aws_security_group_rule.allow_https_ingress.from_port == 443 && aws_security_group_rule.allow_https_ingress.to_port == 443
    error_message = "Port Forwarding for HTTPS not set up"
  }

  assert {
    condition     = aws_security_group_rule.allow_https_ingress.security_group_id == aws_security_group.ingress_control.id
    error_message = "HTTP ingress rule not added to the correct group"
  }

  assert {
    condition     = aws_security_group_rule.allow_https_ingress.protocol == "tcp"
    error_message = "Rule not accepting the correct protocol"
  }
}



run "egress-control"{

  assert {
    condition     = aws_security_group_rule.allow_https_egress.type == "egress"
    error_message = "Type not set to egress"
  }

  assert {
    condition     = aws_security_group_rule.allow_https_egress.cidr_blocks[0] == "0.0.0.0/0"
    error_message = "Does not allow all IPv4 origins for HTTPS"
  }

  assert {
    condition     = aws_security_group_rule.allow_https_egress.ipv6_cidr_blocks[0] == "::/0"
    error_message = "Does not allow all IPv6 origins for HTTPS"
  }


  assert {
    condition     = aws_security_group_rule.allow_https_egress.security_group_id == aws_security_group.egress_control.id
    error_message = "HTTP egress rule not added to the correct group"
  }

  assert {
    condition     = aws_security_group_rule.allow_https_egress.protocol == "-1"
    error_message = "Rule not accepting the correct protocol"
  }

}