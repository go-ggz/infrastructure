provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "ggz" {
  ami                    = "${lookup(var.amis, var.aws_region)}"
  instance_type          = "t2.nano"
  vpc_security_group_ids = ["${aws_security_group.ggz-api-sg.id}"]

  tags {
    Name        = "ggz-api"
    Environment = "${var.environment}"
  }
}

resource "aws_eip" "ggz-ip" {
  instance = "${aws_instance.ggz.id}"

  tags {
    Name        = "ggz-api"
    Environment = "${var.environment}"
  }
}

output "ip" {
  value = "${ aws_eip.ggz-ip.public_ip }"
}
