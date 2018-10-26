resource "aws_api_gateway_domain_name" "demo" {
  domain_name = "demo.dev.ggz.tw"
  regional_certificate_arn = "${aws_acm_certificate.demo_cert.arn}"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

# Route53 is not specifically required; any DNS host can be used.
resource "aws_route53_record" "demo" {
  zone_id = "${aws_route53_zone.dev.id}" # See aws_route53_zone for how to create this

  name = "${aws_api_gateway_domain_name.demo.domain_name}"
  type = "A"

  alias {
    name                   = "${aws_api_gateway_domain_name.demo.regional_domain_name}"
    zone_id                = "${aws_api_gateway_domain_name.demo.regional_zone_id}"
    evaluate_target_health = true
  }
}
