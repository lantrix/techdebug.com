resource "aws_route53_zone" "techdebug_info" {
  name    = "techdebug.com."
  comment = "Managed by Terraform"
  tags = {
    registrar = "https://domains.boostable.com.au/members/domains/details/"
  }
}

resource "aws_route53_record" "techdebug_apex" {
  zone_id = aws_route53_zone.techdebug_info.zone_id
  name    = "techdebug.com."
  type    = "A"
  records = ["20.92.21.38"]
  ttl     = 60
}

resource "aws_route53_record" "techdebug_apex" {
  zone_id = aws_route53_zone.techdebug_info.zone_id
  name    = "www"
  type    = "CNAME"
  records = ["techdebug.com"]
  ttl     = 60
}
