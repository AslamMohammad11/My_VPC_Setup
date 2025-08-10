terraform {
  backend "s3" {
    bucket         = "aslammohammad01"
    key            = "teraformstatefile/terraform.tfstate"
    region         = "ap-south-2"
    encrypt        = true
  }
}