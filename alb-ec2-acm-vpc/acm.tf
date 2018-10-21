resource "aws_acm_certificate" "app_ggz" {
  domain_name       = "app.ggz.tw"
  validation_method = "DNS"

  tags {
    Name        = "ggz-app-domain"
    Owner       = "Bo-Yi Wu"
    Project     = "${var.project}"
    Environment = "${var.environment}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
