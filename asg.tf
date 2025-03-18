resource "aws_launch_template" "auto-scaling-group-web" {
  name = var.launch_template_web_name
  image_id = data.aws_ami.myimage.image_id
  instance_type = var.launch_template_instance_type
  key_name = var.launch_template_key_name
  user_data = file(var.user_data) 
  network_interfaces {
    subnet_id = module.vpc.public_subnet_id_1
    security_groups = [ aws_security_group.webserver_security_group.id]
  }
}

resource "aws_autoscaling_group" "asg-1" {
  desired_capacity = var.asg_desired_capacity
  max_size = var.asg_max_size
  min_size = var.asg_min_size

  launch_template {
    id = aws_launch_template.auto-scaling-group-web.id
    version = var.launch_template_version
  }
}

resource "aws_launch_template" "auto-scaling-group-application" {
  name = var.launch_template_app_name
  image_id = data.aws_ami.myimage.image_id
  instance_type = var.launch_template_instance_type
  key_name = var.launch_template_key_name
  network_interfaces {
    subnet_id = module.vpc.private_subnet_1_id
    security_groups = [ aws_security_group.ssh_security_group.id]
  }
}

resource "aws_autoscaling_group" "asg-2" {
  desired_capacity = var.asg_desired_capacity
  max_size = var.asg_max_size
  min_size = var.asg_min_size

  launch_template {
    id = aws_launch_template.auto-scaling-group-private.id
    version = var.launch_template_version
  }
}

data "aws_ami" "myimage" {
  most_recent = var.true_argument
  owners      = [var.data_block_owners]

  filter {
    name   = var.data_block_name
    values = [var.data_block_values]
  }
}