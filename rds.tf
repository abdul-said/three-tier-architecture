resource "aws_db_instance" "db" {
  allocated_storage    = var.db_instance_allocated_storage
  db_name              = var.db_instance_name
  engine               = var.db_instance_engine
  engine_version       = var.db_instance_engine_version
  instance_class       = var.db_instance_class
  username             = var.db_instance_username
  password             = var.db_instance_password
  parameter_group_name = var.db_instance_parameter_group_name
  skip_final_snapshot  = var.true_argument
  multi_az = var.true_argument
  db_subnet_group_name = aws_db_subnet_group.db-sg.name
  vpc_security_group_ids = [aws_security_group.database_security_group.id]
}

resource "aws_db_subnet_group" "db-sg" {
  name       = var.db_subnet_group_name
  subnet_ids = [module.vpc.private_db_subnet_1, module.vpc.private_db_subnet_2]

  tags = {
    Name = var.db_subnet_group_tags_name
  }
}