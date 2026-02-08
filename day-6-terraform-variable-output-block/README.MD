# Day-5: Terraform Variables and Outputs

terraform Variables and Outputs
these are used to make Terraform code reusable and readable

Simple understanding:
- Variables = input we give to Terraform
- Outputs = result Terraform shows after apply

Think like:
input → terraform → output


# Terraform Variables

variables are used to avoid hardcoding values
Instead of writing fixed values like region, instance type, names   we pass them as variables

This helps reuse same code for dev / test / prod

Variables are defined using "variable" block.

Example:

```terraform
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}
```


Use variable anywhere with:

var.region

Example usage:

provider "aws" {
  region = var.region
}



# Variable Without Default (Required Input)

If no default is provided Terraform will ask value at runtime.

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}


# Ways to Pass Variable Values

Method 1 — terraform.tfvars file (auto loaded)

Create file: terraform.tfvars

region = "us-east-1"
instance_type = "t3.micro"

--------------------------------------------------

Method 2 — Command line

terraform apply -var="region=us-west-1"

--------------------------------------------------


# Terraform Outputs

outputs are used to print useful info after resources are created

Useful for:
- public IP
- DNS
- resource id
- URLs
- bucket names

Defined using output block.

Example:

output "instance_public_ip" {
  value = aws_instance.myec2.public_ip
}

After terraform apply → Terraform prints this value.

--------------------------------------------------

# Output With Description

output "instance_id" {
  description = "ID of created EC2 instance"
  value       = aws_instance.myec2.id
}

--------------------------------------------------

# Sensitive Output (hide secrets)

output "db_password" {
  value     = aws_db_instance.db.password
  sensitive = true
}

This hides value in CLI output.

--------------------------------------------------

# Full Example — Variables + Outputs

variables.tf

variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

--------------------------------------------------

main.tf

provider "aws" {
  region = var.region
}

resource "aws_instance" "demo" {
  ami           = "ami-0abcdef12345"
  instance_type = var.instance_type
}

--------------------------------------------------

outputs.tf

output "ec2_ip" {
  value = aws_instance.demo.public_ip
}

output "ec2_id" {
  value = aws_instance.demo.id
}

--------------------------------------------------

# Notes
variables.tf and outputs.tf are naming conventions only


--------------------------------------------------

