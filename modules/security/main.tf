

# Ingress Security Group
resource "aws_security_group" "ingress_control" {
  name        = "allow_ingress"
  vpc_id      = var.vpc_id
}


# Ingress Security Group Rule 1
resource "aws_security_group_rule" "allow_http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ingress_control.id
}

# Ingress Security Group Rule 1
resource "aws_security_group_rule" "allow_https_ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ingress_control.id
}



# Egress Security Group
resource "aws_security_group" "egress_control" {
  name        = "egress control"
  vpc_id      = var.vpc_id
}

# Egress Security Group Rule 
resource "aws_security_group_rule" "allow_https_egress" {
  type              = "egress"
  protocol          = "-1"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.egress_control.id
}