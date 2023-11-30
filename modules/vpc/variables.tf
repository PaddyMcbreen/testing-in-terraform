variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default = "10.0.0.0/16"
  type = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default = ["10.0.5.0/24"]
}


variable "private_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default = ["10.0.10.0/24"]
}