############################## SG for ALB ###############################

resource "aws_security_group" "alb_security_group" {
  name        = "ALB Security Group"
  description = "Allow http/https access on port 80/443"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "allow_http/https"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.alb_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.alb_security_group.id
  cidr_ipv6         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.alb_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

######################### SG for application tier #############################

resource "aws_security_group" "ssh_security_group" {
  name        = "SSH Access"
  description = "Enable ssh access on port 22"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "SSH SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ssh_security_group.id
  cidr_ipv4         = "147.12.253.14/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ssh_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

######################## SG for Presentation tier ########################

resource "aws_security_group" "webserver_security_group" {
  name        = "Web Server Security Group"
  description = "Enable http/https access on port 80/443 via ALB and ssh via ssh sg"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "Web server SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_webserver" {
  security_group_id = aws_security_group.webserver_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_webserver" {
  security_group_id = aws_security_group.webserver_security_group.id
  cidr_ipv6         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_webserver" {
  security_group_id = aws_security_group.webserver_security_group.id
  cidr_ipv4         = "147.12.253.14/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.webserver_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

############################# SG for DB ################################

resource "aws_security_group" "database_security_group" {
  name        = "Database Security Group"
  description = "Enable database access on port 3306 and ssh via ssh sg"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "Database SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "MySQL access" {
  security_group_id = aws_security_group.database_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_webserver" {
  security_group_id = aws_security_group.database_security_group.id
  cidr_ipv4         = "147.12.253.14/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.database_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}