resource "aws_s3_bucket" "deji_static_website" {
  bucket = "dejistaticweb"
}

resource "aws_s3_bucket_website_configuration" "deji_static_website" {
  bucket = aws_s3_bucket.deji_static_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "deji_static_website" {
  bucket = aws_s3_bucket.deji_static_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "deji_static_website" {
  bucket = aws_s3_bucket.deji_static_website.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "deji_static_website" {
  depends_on = [
    aws_s3_bucket_ownership_controls.deji_static_website,
    aws_s3_bucket_public_access_block.deji_static_website,
  ]

  bucket = aws_s3_bucket.deji_static_website.id
  acl    = "public-read"
}