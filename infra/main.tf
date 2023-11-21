module "s3-website" {
  source = "./modules/s3-website"
  bucket_name = "my-website-cicd-github2023"
}

output "name" {
  value = aws_s3_bucket.this.name
}
