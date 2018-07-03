data "aws_subnet" "selected_a" {
  id = "${var.aws_subnet_id_a}"
}

data "aws_subnet" "selected_c" {
  id = "${var.aws_subnet_id_c}"
}

resource "aws_lb" "ggz_api" {
  name               = "ggz-api"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.ggz_alb_sg.id}"]
  subnets            = ["${data.aws_subnet.selected_a.id}", "${data.aws_subnet.selected_c.id}"]

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
  vpc_id      = "${var.aws_vpc_id}"
  target_type = "instance"
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.ggz_api.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.ggz_api.arn}"
    type             = "forward"
  }
}