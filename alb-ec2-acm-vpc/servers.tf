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

# Retrieve the AZ where we want to create network resources
# This must be in the region selected on the AWS provider.
data "aws_availability_zone" "ggz" {
  name = "${var.aws_region}a"
}
