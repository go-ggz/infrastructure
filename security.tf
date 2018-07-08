resource "aws_security_group" "ggz_alb_sg" {
  name        = "ggz alb sg"
  description = "ggz load balancer security group"
  vpc_id      = "${aws_vpc.ggz.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "ggz-api"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group" "ggz_api_sg" {
  name        = "ggz api sg"
  description = "ggz api service security group"
  vpc_id      = "${aws_vpc.ggz.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "ggz-api"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group_rule" "allow_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.ggz_alb_sg.id}"
}

resource "aws_security_group_rule" "allow_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.ggz_alb_sg.id}"
}

resource "aws_security_group_rule" "allow_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.ggz_api_sg.id}"
}

resource "aws_security_group_rule" "allow_alb" {
  type      = "ingress"
  from_port = 0
  to_port   = 65535
  protocol  = "tcp"

  security_group_id        = "${aws_security_group.ggz_api_sg.id}"
  source_security_group_id = "${aws_security_group.ggz_alb_sg.id}"
}
