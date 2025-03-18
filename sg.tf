############################## SG for ALB ###############################

resource "aws_security_group" "alb_security_group" {
  name        = var.alb_sg_name
  description = var.alb_sg_description
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = var.alb_sg_tag_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_alb" {
  security_group_id = aws_security_group.alb_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_http
  ip_protocol       = var.ip_protocol
  to_port           = var.port_http
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_alb" {
  security_group_id = aws_security_group.alb_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_https
  ip_protocol       = var.ip_protocol
  to_port           = var.port_https
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_alb" {
  security_group_id = aws_security_group.alb_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.ip_protocol_all_ports # semantically equivalent to all ports
}

######################### SG for application tier #############################

resource "aws_security_group" "ssh_security_group" {
  name        = var.app_sg_name
  description = var.app_sg_description
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = var.app_sg_tags_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_app" {
  security_group_id = aws_security_group.ssh_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_ssh
  ip_protocol       = var.ip_protocol
  to_port           = var.port_ssh
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_app" {
  security_group_id = aws_security_group.ssh_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.ip_protocol_all_ports # semantically equivalent to all ports
}

######################## SG for Presentation tier ########################

resource "aws_security_group" "webserver_security_group" {
  name        = var.web_server_sg_name
  description = var.web_server_sg_description
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = var.web_server_sg_tags_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_webserver" {
  security_group_id = aws_security_group.webserver_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_http
  ip_protocol       = var.ip_protocol
  to_port           = var.port_http
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_webserver" {
  security_group_id = aws_security_group.webserver_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_https
  ip_protocol       = var.ip_protocol
  to_port           = var.port_https
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_webserver" {
  security_group_id = aws_security_group.webserver_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_ssh
  ip_protocol       = var.ip_protocol
  to_port           = var.port_ssh
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_webserver" {
  security_group_id = aws_security_group.webserver_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.ip_protocol_all_ports # semantically equivalent to all ports
}

############################# SG for DB ################################

resource "aws_security_group" "database_security_group" {
  name        = var.db_sg_name
  description = var.db_sg_description
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = var.db_sg_tags_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "MySQL_access" {
  security_group_id = aws_security_group.database_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_mysql_access
  ip_protocol       = var.ip_protocol
  to_port           = var.port_mysql_access
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_db" {
  security_group_id = aws_security_group.database_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.ip_protocol_all_ports # semantically equivalent to all ports
}