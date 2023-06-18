output "certificate-arn" {
  description = "ARN of ACM Certificate for cloudfront to use"
  value       = aws_acm_certificate_validation.media.certificate_arn
}
