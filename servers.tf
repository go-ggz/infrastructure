resource "aws_instance" "ggz" {
  ami             = "${lookup(var.amis, var.aws_region)}"
  instance_type   = "t2.nano"
  security_groups = ["${aws_security_group.ggz_api_sg.name}"]
  key_name        = "${var.key_name}"

  tags {
    Name        = "ggz-api"
    Environment = "${var.environment}"
  }
}

resource "aws_eip" "ggz_ip" {
  instance = "${aws_instance.ggz.id}"

  tags {
    Name        = "ggz-api"
    Environment = "${var.environment}"
  }
}
