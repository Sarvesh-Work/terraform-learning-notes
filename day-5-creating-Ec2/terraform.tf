# Defining Terraform configurations

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # --> source of the provider API to download
      version = "~> 5.0"        # --> provider (API) version
    }
  }
}

# this block is used to configure the provider we are using
provider "aws" { # --> Provider block
  region = "us-east-1"
}
