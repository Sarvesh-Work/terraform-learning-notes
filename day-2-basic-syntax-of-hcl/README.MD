Day-2 Basic syntax of hcl 

# Core part 
  the core part of terraform hcl syntax is
  1. block
  2. resource type
  3. arguments

  # ex -->
    <-block-> <-resource type-> <-local name of resource-> {
     code body
     also we have arguments here
    }

# Blocks -->  
  blocks are nothing but the  thing that we are creating it classified in this 
    1. resource -> means telling that we are creating a cloud resource  
   # ex-->  
    resource "aws_instance" "instance-1" {  
        code.....  
    }  

   2. provider -> telling the info about the cloud like which one to use, because terraform works with every cloud provider also region etc..  

   3. variable -> these are same like normal javascript or java variables that we define  
   # ex-->  
      variable "instance_type" {  
      default = "t2.micro"  
      }  

   using this -->  
   instance_type = var.instance_type  

   this means we are passing the value of the variable into the resource argument  

   4. output -> used to print values after terraform apply  
   # ex-->  
      output "instance_id" {  
        value = aws_instance.instance-1.id  
      }  

   5. module -> used to reuse terraform code written in another folder or from terraform registry
