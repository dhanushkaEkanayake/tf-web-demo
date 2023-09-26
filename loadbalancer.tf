resource "aws_lb" "applova_alb" {
  name               = "applova-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.applova-web_SG.id]
  subnets            = [aws_subnet.applova_subnet_1.id, aws_subnet.applova_subnet_2.id, aws_subnet.applova_subnet_3.id]
}

resource "aws_lb_listener" "applova_lb_listener" {
  load_balancer_arn = aws_lb.applova_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.applova_tg.arn
  }
}

resource "aws_lb_target_group" "applova_tg" {
  name     = "applova-tg"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.applova_vpc.id
}
