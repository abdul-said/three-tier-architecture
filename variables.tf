variable "public_subnet_cidr_1" {
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr_2" {
  default = "10.0.2.0/24"
}

variable "private_subnet_cidr_1" {
  default = "10.0.10.0/24"
}

variable "private_subnet_cidr_2" {
  default = "10.0.11.0/24"
}
variable "private_db_subnet_cidr_1" {
  default = "10.0.5.0/24"
}

variable "private_db_subnet_cidr_2" {
  default = "10.0.6.0/24"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "default_cidr_block" {
  default = "0.0.0.0/0"
}

variable "internet_gateway_name" {
  default = "my_internet_gateway"
}

variable "vpc_name" {
  default = "dev_vpc"
}

variable "application_load_balancer_name" {
  default = "three_tier-lb-"
}

variable "false_argument" {
  default = false
}

variable "load_balancer_type" {
  default = "application"
}

variable "alb_listener_port" {
  default = "80"
}

variable "alb_listener_protocol" {
  default = "HTTP"
}

variable "alb_default_action_type" {
  default = "redirect"
}

variable "redirect_port" {
  default = "443"
}

variable "redirect_protocol" {
  default = "HTTPS"
}

variable "redirect_status_code" {
  default = "HTTP_301"
}

variable "alb_target_group_name" {
  default = "application-lb-target-group"
}

variable "alb_target_group_port" {
  default = "80"
}

variable "alb_target_group_protocol" {
  default = "HTTP"
}

variable "alb_target_group_attachment_port" {
  default = "80"
}

variable "launch_template_web_name" {
  default = "auto-scaling-group-web"
}

variable "launch_template_app_name" {
  default = "auto-scaling-group-application"
}

variable "launch_template_instance_type" {
  default = "t2.micro"
}

variable "launch_template_key_name" {
  default = "terraform-key"
}

variable "user_data" {
  default = "user-data.sh"
}

variable "launch_template_version" {
  default = "$Latest"
}

variable "true_argument" {
  default = true
}

variable "data_block_owners" {
  default = "amazon"
}

variable "data_block_name" {
  default = "name"
}

variable "data_block_values" {
  default = "ubuntu/images/hvm-ssd/ubuntu-*-*-amd64-server-*"
}

variable "asg_desired_capacity" {
  default = 1
}

variable "asg_min_size" {
  default = 1
}

variable "asg_max_size" {
  default = 2
}

variable "db_instance_allocated_storage" {
  default = 10
}

variable "db_instance_name" {
  default = "mydb"
}

variable "db_instance_engine" {
  default = "mysql"
}

variable "db_instance_engine_version" {
  default = "8.0"
}

variable "db_instance_class" {
  default = "db.t3.micro"
}

variable "db_instance_username" {
  default = "username"
}

variable "db_instance_password" {
  default = "password"
}

variable "db_instance_parameter_group_name" {
  default = "default.mysql8.0"
}

variable "db_subnet_group_name" {
  default = "main"
}

variable "db_subnet_group_tags_name" {
  default = "My DB subnet group"
}

variable "alb_sg_name" {
  default = "ALB Security Group"
}

variable "alb_sg_description" {
  default = "Allow http/https access on port 80/443"
}

variable "alb_sg_tag_name" {
  default = "allow_http/https"
}

variable "cidr_ipv4" {
  default = "0.0.0.0/0"
}

variable "port_http" {
  default = 443
}

variable "port_https" {
  default = 80
}

variable "ip_protocol" {
  default = "tcp"
}

variable "ip_protocol_all_ports" {
  default = "-1"
}

variable "app_sg_name" {
  default = "SSH Access"
}

variable "app_sg_description" {
  default = "Enable ssh access on port 22"
}

variable "app_sg_tags_name" {
  default = "SSH SG"
}

variable "port_ssh" {
  default = 22
}

variable "web_server_sg_name" {
  default = "Web Server Security Group"
}

variable "web_server_sg_description" {
  default = "Enable http/https access on port 80/443 via ALB and ssh via ssh sg"
}

variable "web_server_sg_tags_name" {
  default = "Web server SG"
}

variable "db_sg_name" {
  default = "Database Security Group"
}

variable "db_sg_description" {
  default = "Enable database access on port 3306 and ssh via ssh sg"
}

variable "db_sg_tags_name" {
  default = "Database SG"
}

variable "port_mysql_access" {
  default = 3306
}