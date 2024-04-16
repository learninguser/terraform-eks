terraform {
  backend "s3" {
    bucket         = "learninguser"
    key            = "terraform-eks"
    region         = "us-east-1"
    dynamodb_table = "terraform_lock"
  }
}
