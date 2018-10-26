resource "aws_route53_zone" "dev" {
  name = "dev.ggz.tw"

  tags {
    Environment = "${var.environment}"
  }
}
