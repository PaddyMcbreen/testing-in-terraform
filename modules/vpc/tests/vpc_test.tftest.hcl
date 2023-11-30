 run "public_subnets" {

   assert {
     condition     = alltrue([for subnet in aws_subnet.public_subnets[*] : subnet.vpc_id == aws_vpc.main.id])
     error_message = "Public Subnets not assigned to correct VPC"
   }

   assert {
     condition     = alltrue(aws_subnet.public_subnets[*].map_public_ip_on_launch)
     error_message = "Does not create public ip"
   }

   assert {
     condition     = alltrue([for subnet in aws_subnet.public_subnets[*] : endswith(subnet.cidr_block, "/24")])
     error_message = "Public CIDR blocks do not have the correct suffix"
   }
 }

 run "private_subnets" {


   assert {
     condition     = alltrue([for subnet in aws_subnet.private_subnets[*] : subnet.vpc_id == aws_vpc.main.id])
     error_message = "Private Subnets not assigned to correct VPC"

   }

   assert {
     condition     = !alltrue(aws_subnet.private_subnets[*].map_public_ip_on_launch)
     error_message = "Creates public IPs in a private subnet"
   }

   assert {

     condition     = alltrue([for subnet in aws_subnet.private_subnets[*] : endswith(subnet.cidr_block, "/24")])
     error_message = "Private CIDR blocks do not have the correct suffix"
   }
 }

 run "internet_gateway" {
   assert {
     condition     = aws_internet_gateway.igw.vpc_id == aws_vpc.main.id
     error_message = "Internet Gateway not attached to VPC"
   }
 }

 run "route_tables" {

   assert {
     condition     = aws_route_table.public_route_table.vpc_id == aws_vpc.main.id
     error_message = "Public route table is not attached to VPC"
   }

   assert {
     condition     = aws_route.igw.route_table_id == aws_route_table.public_route_table.id
     error_message = "IGW Route not connected to route table"
   }

  assert {
     condition     = aws_route.igw.destination_cidr_block == "0.0.0.0/0"
     error_message = "Does not allow all traffic to leave"
   }

   assert {
     condition     = aws_route.igw.gateway_id == aws_internet_gateway.igw.id
     error_message = "Route does not forward traffic to the IGW"
   }

   assert {
     condition     = aws_route_table_association.public[0].subnet_id == aws_subnet.public_subnets[0].id
     error_message = "Public subnets not associated with public route table"
   }
 }
