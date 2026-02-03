# Day-3: Terraform Basic Commands

# 1.terraform init
  this is the first command we run in any terraform project
  It initializes Terraform in the current folder.
  it downloads required providers and creates hidden files/folders
  like .terraform and terraform.lock.hcl to manage state and dependencies

  Note:
   when we run "terraform init" Terraform scans all .tf files in the folder checks which providers are used locks their versions
   and installs them automatically
   So before running any Terraform code (plan/apply)
   we must run "terraform init" at least once

  ex--> terraform init


# 2.terraform validate
  This command is used to validate our Terraform configuration files
  It checks for syntax errors and basic issues in .tf files.
  This command is optional but recommended before plan/apply

  ex--> terraform validate


# 3.terraform plan
  This command shows what Terraform is going to do before actually doing it.
  It creates an execution plan and tells us:
   - what resources will be created
   - what will be modified
   - what will be destroyed
  it does NOT create any infrastructure

  ex--> terraform plan

# Example output:
  Terraform used the selected providers to generate the following execution plan.
  Resource actions are indicated with the following symbols:
    + create

 Terraform will perform the following actions:

  local_file.automate_file_creation will be created
   + resource "local_file" "automate_file_creation" {
       + content         = "this file is created using terraform"
         + filename        = "create_file"
         + file_permission = "0777"
         + id              = (known after apply)
       }
  
   Plan: 1 to add, 0 to change, 0 to destroy.  

# 4.terraform apply
  This is the main command that actually applies the configuration
   It creates or updates the infrastructure based on the plan.
  Terraform will ask for confirmation before proceeding.
  After confirmation resources are created and state is updated

  ex--> terraform apply

# 5. terraform destroy 
  this command is use to destroy our infrastructure 
  from the  cloud provider with one click it destroy every thing thats there in our .tf file.

# Note:- to destroy the specific resource in terraform
  we can use this command 

  ex --> terraform destroy -target=<-resource_type.resource_name->
  
