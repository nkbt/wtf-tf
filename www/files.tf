module "www_files" {
  source   = "hashicorp/dir/template"
  base_dir = "${path.module}/src"
  template_vars = {
    www_title   = "Terraform workshop"
    hello_world = "Hello, World!"
  }
}


resource "aws_s3_bucket_object" "www_files" {
  for_each = module.www_files.files

  bucket       = aws_s3_bucket.www.id
  key          = each.key
  content_type = each.value.content_type
  content      = each.value.content

  etag = each.value.digests.md5
}
