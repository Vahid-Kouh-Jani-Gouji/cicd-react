resource "aws_s3_bucket" "this" {
  bucket = "my-website-cicd-github2023" #var.bucket_name

  # Allow deletion of non-empty bucket
  force_destroy = true

  tags = {
    Name        = "My lovely website"
    Terraform   = "True"
  }
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "arn:aws:s3:::${aws_s3_bucket.this.id}/*",
        "arn:aws:s3:::${aws_s3_bucket.this.id}"
      ]
    }
  ]
}
POLICY
}
