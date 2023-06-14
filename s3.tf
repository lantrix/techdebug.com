resource "aws_s3_bucket" "techdebug" {
  bucket = var.bucketName
}

resource "aws_s3_bucket_public_access_block" "techdebug-public" {
  bucket = aws_s3_bucket.techdebug.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "techdebug-config" {
  bucket = aws_s3_bucket.techdebug.id
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "techdebug-policy" {
  bucket = aws_s3_bucket.techdebug.id
  policy = templatefile("${path.module}/s3-policy.json", { bucket = var.bucketName })
}
