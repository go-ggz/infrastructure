data "template_file" "user_data" {
  template = "${file("${path.module}/user-data/user-data.sh")}"

  vars {
    instance_text = "${var.instance_text}"
    instance_port = "${var.instance_port}"
  }
}
