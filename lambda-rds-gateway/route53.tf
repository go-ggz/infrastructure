resource "aws_route53_zone" "dev" {
  name    = "dev.ggz.tw"
  comment = "dev ggz domain"

  tags {
    Environment = "${var.environment}"
  }
}
