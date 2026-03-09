# example Create multiple EC2 instances using for_each

resource "aws_instance" "vm" {
  for_each = var.instances   # loop over map/set of instances

  # ensure VPC is created before instances (explicit dependency example)
  depends_on = [
    aws_vpc.main
  ]

  ami           = "ami-0abc123"
  instance_type = each.value   # value from map (instance type)

  tags = {
    Name = each.key            # key from map (instance name)
  }
}
