resource "aws_key_pair" "ggz" {
  key_name   = "ggz"
  public_key = "${var.ssh_public_key}"
}
