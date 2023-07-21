output "zone-id" {
  description = "ID Of Route53 Zone for site"
  value       = aws_route53_zone.techdebug_info.zone_id
}
