resource "aws_lb" "ggz_api" {
  name               = "ggz-api"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.ggz_alb_sg.id}"]
  subnets            = ["${aws_subnet.ggz_a.id}", "${aws_subnet.ggz_c.id}"]

  enable_deletion_protection = false

  tags {
    Name        = "ggz-api"
    Environment = "${var.environment}"
  }
}

resource "aws_lb_target_group" "ggz_api" {
  name        = "ggz-api-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.ggz.id}"
  target_type = "instance"

  health_check = {
    interval = 10
    path     = "/healthz"
    matcher  = "200-299"
  }

  tags {
    Name        = "ggz-api"
    Environment = "${var.environment}"
  }
}

resource "aws_lb_target_group_attachment" "ggz_api" {
  target_group_arn = "${aws_lb_target_group.ggz_api.arn}"
  target_id        = "${aws_instance.ggz.id}"
  port             = 8080
}

resource "aws_lb_listener" "front_end_http" {
  load_balancer_arn = "${aws_lb.ggz_api.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.ggz_api.arn}"
    type             = "forward"
  }
}

resource "aws_lb_listener" "front_end_https" {
  load_balancer_arn = "${aws_lb.ggz_api.arn}"
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "${aws_acm_certificate.app_ggz.arn}"
  ssl_policy        = "ELBSecurityPolicy-2015-05"

  default_action {
    target_group_arn = "${aws_lb_target_group.ggz_api.arn}"
    type             = "forward"
  }
}
