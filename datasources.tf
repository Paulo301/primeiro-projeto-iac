data "aws_s3_bucket" "bucket" {
  bucket = "rocketseat-bucket-iac-paulo-lemos-${terraform.workspace}"
}