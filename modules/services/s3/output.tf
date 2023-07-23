
output "cloudfront-id" {
  description = "ID of Cloudfront Distribution for the site"
  value       = aws_cloudfront_distribution.techdebug-com.id
}
