resource "aws_lb" "test_nlb" {
  name               = "test-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [aws_subnet.pub_subnet_2a.id]


  tags = {
    Environment = "production"
  }
}


resource "aws_lb_target_group" "test_nlb_tg_ip" {
  name     = "Test-nlb-tg"
  port     = 80
  protocol = "TCP_UDP"
  vpc_id   = aws_vpc.test_vpc.id

  depends_on = [aws_lb.test_nlb]
}

resource "aws_lb_listener" "aws_lb_ls" {
  load_balancer_arn = aws_lb.test_nlb.arn
  port              = "80"
  protocol          = "TCP_UDP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test_nlb_tg_ip.arn
  }
}

resource "aws_lb_target_group_attachment" "lb_tg_att" {
  target_group_arn = aws_lb_target_group.test_nlb_tg_ip.arn
  target_id        = aws_instance.ec2_in_2a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "lb_tg_att2" {
  target_group_arn = aws_lb_target_group.test_nlb_tg_ip.arn
  target_id        = aws_instance.ec2_in_2b.id
  port             = 80
}
