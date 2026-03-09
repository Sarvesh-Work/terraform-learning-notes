# Day-7: Terraform Meta Arguments and Loops

terraform Meta Arguments help control how resources are created and in what way loops are handled

These are not resource specific we can use them with most resources

Simple understanding:

* count → how many copies of resource to create
* for_each → create resources using map or set
* depends_on → force resource creation order
* for → loop for data transformation (not resource creation)


# count

count is used when we want multiple copies of the same resource.

Best when:

* same configuration
* only number changes
* simple use case

count gives index number starting from 0.

Example:

```terraform
resource "aws_instance" "server" {
  count = 2

  ami           = "ami-0abc123"
  instance_type = "t2.micro"

  tags = {
    Name = "server-${count.index}"
  }
}
```

What happens:

Terraform creates:

```
server[0]
server[1]
```

- important note:

If count number changes terraform may destroy and recreate resources
So not ideal for dynamic named resources

---

# for_each

for_each is used to create resources by looping over a map or set

Best when:

* resources have different names
* config driven creation
* production usage
* stable identity needed

Works with:

* map
* set
  Not with list directly.

Example using set:

```terraform
variable "names" {
  default = ["app", "db"]
}

resource "aws_instance" "vm" {
  for_each = toset(var.names)

  ami           = "ami-0abc123"
  instance_type = "t2.micro"

  tags = {
    Name = each.value
  }
}
```

Terraform creates:

```
vm["app"]
vm["db"]
```

each.value → current value
each.key → same as value in set

---

Example using map:

```terraform
variable "instances" {
  default = {
    app = "t2.micro"
    db  = "t2.small"
  }
}

resource "aws_instance" "vm" {
  for_each = var.instances

  ami           = "ami-0abc123"
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
```

each.key → map key
each.value → map value

---

# Why toset is used with list

for_each does not accept list directly.

Wrong:

```terraform
for_each = var.names --> when using list this is wrong
```

Correct:

```terraform
for_each = toset(var.names) --> when using list convert to set and  use it
```


---

# depends_on

depends_on is used to force Terraform to create resources in specific order

normally Terraform auto-detects dependency using references
But when dependency is indirect  we use depends_on.

Example:

```terraform
resource "aws_s3_bucket" "data" {
  bucket = "demo-bucket"
}

resource "aws_instance" "app" {
  ami           = "ami-0abc123"
  instance_type = "t2.micro"

  depends_on = [
    aws_s3_bucket.data
  ]
}
```

Meaning:

```
first → bucket
then → instance
```

Use when:

* hidden dependency
* script execution order needed
* IAM / policy attachments etc

---

# for (expression loop)

for loop is used inside expressions

It does NOT create resources
It transforms or filters data

Used in:

* outputs
* locals
* variables
* tags generation

Example — transform list:

```terraform
variable "nums" {
  default = [1,2,3]
}

output "double" {
  value = [for n in var.nums : n * 2]
}
```

Output:

```
[2,4,6]
```

---

Example — filter values:

```terraform
output "even" {
  value = [for n in var.nums : n if n % 2 == 0]
}
```

---

Example — map creation:

```terraform
output "name_map" {
  value = {
    for n in ["app","db"] :
    n => upper(n)
  }
}
```

---
