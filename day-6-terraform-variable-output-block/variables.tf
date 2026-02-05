variable "aws_instance_type" {
    default ="t2.micro"  # value
    type = string   # type
}

variable "aws_instance_size" {
    default = 8
    type = number
}

variable "aws_instance_ami_id" {
    default = "ami-0b6c6ebed2801a5cb"
    type = string
}



