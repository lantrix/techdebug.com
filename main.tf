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
  region = var.region
  default_tags {
    tags = {
      source = "https://github.com/lantrix/techdebug.com"
    }
  }
}
# Second provider to deploy ACM in a different region
provider "aws" {
  alias  = "useast1"
  region = var.acm-region
  default_tags {
    tags = {
      source = "https://github.com/lantrix/techdebug.com"
    }
  }
}
module "dns" {
  source = "./modules/services/dns"
}
module "acm" {
  depends_on = [module.dns]
  providers = {
    aws = aws.useast1
  }
  source = "./modules/services/acm"
  region = var.acm-region
  domain = var.domain
}
module "s3" {
  depends_on      = [module.dns]
  source          = "./modules/services/s3"
  region          = var.region
  bucketName      = var.bucketName
  acm_certificate = module.acm.certificate-arn
  zone_id         = module.dns.zone-id
}
