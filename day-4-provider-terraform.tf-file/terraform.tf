# Defining Terraform configurations

terraform {
  required_version = "1.14.3" # --> tells Terraform to use this CLI version

  required_providers {
    aws = {
      source  = "hashicorp/aws" # --> source of the provider API to download
      version = "~> 5.0"        # --> provider (API) version
    }
  }
}

# this block is used to configure the provider we are using
provider "aws" { # --> Provider block
  region = "ap-south-1"
}
