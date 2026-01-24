Day-1 Intro to Terraform 

# What is terraform 
   terraform is an infrastructure as code tool used to create and manage infrastructure (mostly cloud infra) by writing code files

   ex- creating ec2 instances on aws. it makes it easy to provision resources using the code file we wrote it is also helpful for automation so we don't repeat ourselves. if we need to create 100 instances in one go doing this using the aws console will take a lot of time, but using terraform files it's easy just write the code to define the ec2 instance and use variables or count to create 100 instances

   also it's compatible with multiple cloud providers


# difference between terraform and ansible 

   both tools have their own purpose

   terraform is used to create and manage cloud infrastructure like ec2, s3, rds, vpc, load balancers, etc. it follows infrastructure as code and is mainly for provisioning resources

   ansible is used for virtual machine configuration like installing software on ec2, keeping the installed stuff up to date managing services, and doing this in one click by writing ansible files. it is mainly for configuration management and automation

   terraform keeps track of infrastructure state and can show what changes will happen before applying them

   we can also use ansible to create infrastructure but it is not meant for that we should prefer terraform for infrastructure provisioning and ansible for configuration management

  in real projects both are often used together terraform to create infra and ansible to configure it

# to write the terraform files we use hcl language created by HashiCorp for terraform 