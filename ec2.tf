data "aws_ami" "myimage" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-*-amd64-server-*"]
  }
}

resource "aws_instance" "PublicWebTemplate" {
  ami                    = data.aws_ami.myimage.image_id
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnet_id_1
  vpc_security_group_ids = [aws_security_group.webserver_security_group]
  key_name               = "terraform-key"
  user_data              = file("../user-data")

  tags = {
    Name = "web-instance"
  }
}

resource "aws_instance" "PrivateAppTemplate" {
  ami                    = data.aws_ami.myimage.image_id
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.private_subnet_1_id
  vpc_security_group_ids = [aws_security_group.ssh_security_group]
  key_name               = "terraform-key"

  tags = {
    Name = "app-instance"
  }
}