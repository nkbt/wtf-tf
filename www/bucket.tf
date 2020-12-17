resource "aws_s3_bucket" "www" {
  bucket        = local.bucket_name
  acl           = "public-read"
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}


output "www_url" {
  value = "http://${aws_s3_bucket.www.website_endpoint}"
}
