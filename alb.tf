data "aws_subnet" "selected_a" {
  id = "${var.aws_subnet_id_a}"
}

data "aws_subnet" "selected_c" {
  id = "${var.aws_subnet_id_c}"
}

resource "aws_lb" "ggz-api" {
  name               = "ggz-api"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.ggz_alb_sg.id}"]
  subnets            = ["${data.aws_subnet.selected_a.id}", "${data.aws_subnet.selected_c.id}"]

  enable_deletion_protection = true

  tags {
    Name        = "ggz-api"
    Environment = "${var.environment}"
  }
}
