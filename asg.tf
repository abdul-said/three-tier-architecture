resource "aws_launch_template" "auto-scaling-group-web" {
  name = "auto-scaling-group-web"
  image_id = data.aws_ami.myimage.image_id
  instance_type = "t2.micro"
  key_name = "terraform-key"
  network_interfaces {
    subnet_id = module.vpc.public_subnet_id_1
    security_groups = [ aws_security_group.webserver_security_group.id]
  }
}

resource "aws_autoscaling_group" "asg-1" {
  desired_capacity = 1
  max_size = 2
  min_size = 1

  launch_template {
    id = aws_launch_template.auto-scaling-group-web.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "auto-scaling-group-private" {
  name = "auto-scaling-group-private"
  image_id = data.aws_ami.myimage.image_id
  instance_type = "t2.micro"
  key_name = "terraform-key"
  network_interfaces {
    subnet_id = module.vpc.private_subnet_1_id
    security_groups = [ aws_security_group.ssh_security_group.id]
  }
}

resource "aws_autoscaling_group" "asg-2" {
  desired_capacity = 1
  max_size = 2
  min_size = 1

  launch_template {
    id = aws_launch_template.auto-scaling-group-private.id
    version = "$Latest"
  }
}