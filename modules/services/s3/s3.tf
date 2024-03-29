variable "region" {}
variable "bucketName" {}
variable "acm_certificate" {}
variable "zone_id" {}

data "aws_caller_identity" "current" {}
data "aws_iam_policy_document" "read-s3-bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.techdebug.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.techdebug.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.techdebug.arn]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.techdebug.iam_arn]
    }
  }
}

# Bucket and associated bits
resource "aws_s3_bucket" "techdebug" {
  bucket = var.bucketName
}
resource "aws_s3_bucket_acl" "acl" {
  depends_on = [aws_s3_bucket_ownership_controls.techdebug]
  bucket     = aws_s3_bucket.techdebug.id
  acl        = "private"
}
resource "aws_s3_bucket" "log_bucket" {
  bucket = "${var.bucketName}-logs"
}
resource "aws_s3_bucket_acl" "log_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.techdebug-logs]
  bucket     = aws_s3_bucket.log_bucket.id
  acl        = "log-delivery-write"
}
resource "aws_s3_bucket_logging" "techdebug" {
  bucket = aws_s3_bucket.techdebug.id

  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}
resource "aws_s3_bucket_public_access_block" "techdebug-public" {
  bucket = aws_s3_bucket.techdebug.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_policy" "techdebug-policy" {
  bucket = aws_s3_bucket.techdebug.id
  policy = data.aws_iam_policy_document.read-s3-bucket.json
}

resource "aws_s3_bucket_ownership_controls" "techdebug" {
  bucket = aws_s3_bucket.techdebug.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_ownership_controls" "techdebug-logs" {
  bucket = aws_s3_bucket.log_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
# Cloudfront to serve bucket content over HTTPS
resource "aws_cloudfront_origin_access_identity" "techdebug" {
  comment = "techdebug"
}

resource "aws_cloudfront_distribution" "techdebug-com" {
  enabled             = true
  default_root_object = "index.html"
  aliases             = [aws_s3_bucket.techdebug.bucket]
  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.techdebug.bucket
    viewer_protocol_policy = "redirect-to-https"
    compress               = true

    min_ttl     = 0
    default_ttl = 5 * 60
    max_ttl     = 60 * 60

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }
  }
  ordered_cache_behavior {
    path_pattern           = "/*"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    viewer_protocol_policy = "redirect-to-https"
    target_origin_id       = aws_s3_bucket.techdebug.bucket
    compress               = true
    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.redirect-index-request.arn
    }
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }
  price_class = "PriceClass_All"
  custom_error_response {
    error_code         = 404
    response_code      = 404
    response_page_path = "/404.html"
  }
  origin {
    domain_name = aws_s3_bucket.techdebug.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.techdebug.bucket

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.techdebug.cloudfront_access_identity_path
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_certificate
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }
}

resource "aws_cloudfront_function" "redirect-index-request" {
  name    = "redirect-index-request"
  runtime = "cloudfront-js-1.0"
  comment = "Blog index redirects"
  publish = true
  code    = file("${path.module}/index-function.js")
}

# DNS for cloudfront
resource "aws_route53_record" "techdebug-apex" {
  zone_id = var.zone_id
  name    = "techdebug.com"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.techdebug-com.domain_name
    zone_id                = aws_cloudfront_distribution.techdebug-com.hosted_zone_id
    evaluate_target_health = false
  }
}
