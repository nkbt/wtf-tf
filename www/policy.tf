data "aws_iam_policy_document" "www_policy_doc" {
  statement {
    actions = ["s3:GetObject"]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    resources = ["arn:aws:s3:::${local.bucket_name}/*"]
  }
}


resource "aws_s3_bucket_policy" "www_policy" {
  bucket = aws_s3_bucket.www.id
  policy = data.aws_iam_policy_document.www_policy_doc.json
}
