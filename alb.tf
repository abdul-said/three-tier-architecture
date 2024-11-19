resource "aws_lb" "application" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group]
  subnets            = [module.vpc.public_subnet_id_1.id, module.vpc.public_subnet_id_2.id]

  enable_deletion_protection = false

  

  tags = {
    Name = "ALB"
  }
}

  resource "aws_lb_listener" "application" {
  load_balancer_arn = aws_lb.application.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_target_group" "alb-tg" {
  name     = "application-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id.id
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.PublicWebTemplate.id
  port             = 80
}