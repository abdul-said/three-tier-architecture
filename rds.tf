resource "aws_db_instance" "db" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0.39"
  instance_class       = "db.t2.micro"
  username             = "username"
  password             = "password123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  availability_zone = "eu-west-1"
  multi_az = true
  db_subnet_group_name = aws_db_subnet_group.db-sg.name
  vpc_security_group_ids = [aws_security_group.database_security_group.id]
}

resource "aws_db_subnet_group" "db-sg" {
  name       = "main"
  subnet_ids = [module.vpc.private_db_subnet_1, module.vpc.private_db_subnet_2]

  tags = {
    Name = "My DB subnet group"
  }
}