resource "aws_api_gateway_domain_name" "demo" {
  domain_name = "demo.dev.ggz.tw"
  regional_certificate_arn = "${aws_acm_certificate.demo_cert.arn}"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
