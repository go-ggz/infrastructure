resource "aws_acm_certificate" "app_cert" {
  domain_name       = "app.dev.ggz.tw"
  validation_method = "DNS"
}

resource "aws_route53_record" "app_cert_validation" {
  name    = "${aws_acm_certificate.app_cert.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.app_cert.domain_validation_options.0.resource_record_type}"
  zone_id = "${aws_route53_zone.dev.id}"
  records = ["${aws_acm_certificate.app_cert.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "app_cert" {
  certificate_arn         = "${aws_acm_certificate.app_cert.arn}"
  validation_record_fqdns = ["${aws_route53_record.app_cert_validation.fqdn}"]
}

resource "aws_acm_certificate" "demo_cert" {
  domain_name       = "demo.dev.ggz.tw"
  validation_method = "DNS"
}

resource "aws_route53_record" "demo_cert_validation" {
  name    = "${aws_acm_certificate.demo_cert.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.demo_cert.domain_validation_options.0.resource_record_type}"
  zone_id = "${aws_route53_zone.dev.id}"
  records = ["${aws_acm_certificate.demo_cert.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "demo_cert" {
  certificate_arn         = "${aws_acm_certificate.demo_cert.arn}"
  validation_record_fqdns = ["${aws_route53_record.demo_cert_validation.fqdn}"]
}
