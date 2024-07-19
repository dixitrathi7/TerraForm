resource "aws_s3_bucket" "My-Bucket" {
  bucket = "s3-bucket-contain-tf-state-file-dixit07"
}

resource "aws_s3_bucket_ownership_controls" "My-Bucket" {
  bucket = aws_s3_bucket.My-Bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "My-Bucket" {
  bucket = aws_s3_bucket.My-Bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "My-Bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.My-Bucket,
    aws_s3_bucket_public_access_block.My-Bucket,
  ]

  bucket = aws_s3_bucket.My-Bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.My-Bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["123456789012"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.My-Bucket.arn,
      "${aws_s3_bucket.My-Bucket.arn}/*",
    ]
  }
}
