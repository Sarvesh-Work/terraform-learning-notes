Day-1 Intro to Terraform 

# What is terraform 
   terraform is an infrastructure as code tool used to create and manage infrastructure (mostly cloud infra) by writing code files

   ex- creating ec2 instances on aws. it makes it easy to provision resources using the code file we wrote it is also helpful for automation so we don't repeat ourselves. if we need to create 100 instances in one go doing this using the aws console will take a lot of time, but using terraform files it's easy just write the code to define the ec2 instance and use variables or count to create 100 instances

   also it's compatible with multiple cloud providers


# Difference between terraform and ansible 

   both tools have their own purpose

   terraform is used to create and manage cloud infrastructure like ec2, s3, rds, vpc, load balancers, etc. it follows infrastructure as code and is mainly for provisioning resources

   ansible is used for virtual machine configuration like installing software on ec2, keeping the installed stuff up to date managing services, and doing this in one click by writing ansible files. it is mainly for configuration management and automation

   terraform keeps track of infrastructure state and can show what changes will happen before applying them

   we can also use ansible to create infrastructure but it is not meant for that we should prefer terraform for infrastructure provisioning and ansible for configuration management

  in real projects both are often used together terraform to create infra and ansible to configure it

# To write the terraform files we use hcl language created by HashiCorp for terraform 

# What is iac

  iac means infrastructure as code. instead of creating infrastructure manually by clicking in cloud console, we write code files to define our infrastructure

  using iac, servers, networks, databases, load balancers, and other resources are created using code. this makes infrastructure predictable, repeatable, and easy to manage

  with iac, the same infrastructure can be created multiple times in the same way without manual errors

# Why iac is important

  manual infrastructure creation is slow and error-prone. if something breaks, it is hard to recreate the same setup again

  iac solves this by storing infrastructure in code form, which can be version controlled using git

  it helps in automation, consistency, and faster deployments



# Terraform role in devops

  in devops, terraform is mainly used in the provisioning stage

  it creates cloud infrastructure like ec2, vpc, s3, rds, eks, load balancers, etc

  terraform code is usually stored in git and used by ci/cd pipelines

  using terraform in devops allows teams to automate infrastructure creation and manage multiple environments like dev, staging, and prod