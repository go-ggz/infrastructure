resource "aws_key_pair" "ggz" {
  key_name_prefix = "ggz"
  public_key      = "${var.ssh_public_key}"
}

resource "aws_instance" "ggz" {
  ami                    = "${lookup(var.amis, var.aws_region)}"
  availability_zone      = "${data.aws_availability_zone.ggz.name}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.ggz_api_sg.id}"]
  key_name               = "${aws_key_pair.ggz.key_name}"
  user_data              = "${data.template_file.user_data.rendered}"
  subnet_id              = "${aws_subnet.ggz_a.id}"

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

# Retrieve the AZ where we want to create network resources
# This must be in the region selected on the AWS provider.
data "aws_availability_zone" "ggz" {
  name = "${var.aws_region}a"
}
