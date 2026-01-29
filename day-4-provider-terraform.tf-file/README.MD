# Day-4: Terraform Providers and terraform.tf file


# Provider
  Provider is used to tell Terraform which dependency we want to use It means which cloud or service provider we are working with
  terraform supports multiple providers like:
  AWS, Azure, GCP, Docker, GitHub, Local, etc

  A provider in Terraform is used to interact with the APIs of cloud platforms
  It tells Terraform:
  - which service we want to use
  - how to authenticate
  - which region or configuration to use


# terraform.tf file
  terraform.tf is a normal Terraform configuration file.
  in this file, we usually define:
  - required providers
  - provider versions
  - Terraform version constraints
  It may also include basic configurations related to providers

# Note:
  terraform.tf is NOT a special file
  It is just a naming convention used for better structure.
  we can name this file anything for example:
    - main.tf
    - providers.tf
    - backend.tf
  Terraform loads ALL .tf files together from the same directory
