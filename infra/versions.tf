terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


terraform {
  backend "s3" {
    bucket         = "terraformBackendVahid2023"
    key            = "terraform.tfstate"
    region         = var.region
    encrypt        = true
    dynamodb_table = "terraform_locks"
  }
}
