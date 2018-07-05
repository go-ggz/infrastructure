resource "aws_acm_certificate" "cert" {
  domain_name       = "app.ggz.tw"
  validation_method = "DNS"

  tags {
    Name        = "ggz"
    Environment = "${var.environment}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
