resource "aws_s3_bucket" "s3_bucket" {
  bucket = "rocketseat-bucket-iac-paulo-lemos-${terraform.workspace}"

  tags = {
    Name = "Primeiro bucket"
    Iac  = true
    Context = "${terraform.workspace}"
  }
}