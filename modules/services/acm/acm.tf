# ACM Certificate

variable "region" {}
variable "domain" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.3.0"
    }
  }
}
data "aws_route53_zone" "techdebug" {
  name = "techdebug.com."
}

resource "aws_acm_certificate" "cloudfront" {
  domain_name       = var.domain
  validation_method = "DNS"
}
resource "aws_route53_record" "validate" {
  for_each = {
    for dvo in aws_acm_certificate.cloudfront.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.techdebug.zone_id
}

resource "aws_acm_certificate_validation" "media" {
  certificate_arn         = aws_acm_certificate.cloudfront.arn
  validation_record_fqdns = [for record in aws_route53_record.validate : record.fqdn]
}
