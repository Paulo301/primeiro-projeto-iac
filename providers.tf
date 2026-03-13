terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket  = "rocketseat-pvl-state-bucket-tf"
    region  = "us-east-2"
    key     = "terraform.tfstate"
    encrypt = true
    profile = "paulo-lemos-defensoria"
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "paulo-lemos-defensoria"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [aws_s3_bucket.terraform_state]
}
