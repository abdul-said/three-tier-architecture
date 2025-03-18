resource "aws_lb" "application" {
  name               = var.application_load_balancer_name
  internal           = var.false_argument
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = [module.vpc.public_subnet_id_1, module.vpc.public_subnet_id_2]

  enable_deletion_protection = var.false_argument
}

  resource "aws_lb_listener" "application" {
  load_balancer_arn = aws_lb.application.arn
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol

  default_action {
    type = var.alb_default_action_type

    redirect {
      port        = var.redirect_port
      protocol    = var.redirect_protocol
      status_code = var.redirect_status_code
    }
  }
}

resource "aws_lb_target_group" "alb-tg" {
  name     = var.application_load_balancer_name
  port     = var.alb_target_group_port
  protocol = var.alb_target_group_protocol
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.PublicWebTemplate.id
  port             = 80
}