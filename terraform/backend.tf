terraform {
  backend "s3" {
    bucket         = "shubhamm-es-2025"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

