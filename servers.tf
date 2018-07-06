resource "aws_instance" "ggz" {
  ami             = "${lookup(var.amis, var.aws_region)}"
  instance_type   = "t2.nano"
  security_groups = ["${aws_security_group.ggz_api_sg.name}"]
  key_name        = "${var.key_name}"
  user_data       = "${data.template_file.user_data.rendered}"

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

data "template_file" "user_data" {
  template = "${file("${path.module}/user-data/user-data.sh")}"

  vars {
    instance_text = "${var.instance_text}"
    instance_port = "${var.instance_port}"
  }
}
