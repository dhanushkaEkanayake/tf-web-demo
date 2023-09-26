resource "aws_lb" "creativehub_alb" {
  name               = "creativehub-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.creativeHub-web_SG.id]
  subnets            = [aws_subnet.creativeHub_subnet_1.id, aws_subnet.creativeHub_subnet_2.id, aws_subnet.creativeHub_subnet_3.id]
}

resource "aws_lb_listener" "creativeHub_lb_listener" {
  load_balancer_arn = aws_lb.creativehub_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.creativehub_tg.arn
  }
}

resource "aws_lb_target_group" "creativehub_tg" {
  name     = "creativehub-tg"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.creativeHub_vpc.id
}
