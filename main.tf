terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.3.0"
    }
  }
  backend "s3" {
    workspace_key_prefix = "techdebug-com"
    key                  = "techdebug-com-terraform.tfstate"
    region               = "ap-southeast-2"
    dynamodb_table       = "terraform-state"
  }
}

provider "aws" {
  region = "ap-southeast-4"
  default_tags {
    tags = {
      source = "https://github.com/lantrix/techdebug.com"
    }
  }
}
