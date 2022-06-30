variable "amis" {
  default = {
      "ubuntu" = "ami-026c8acd92718196b"
  }
}
variable "key_name" {
  default = "terraform-aws"
}
variable "instance_type" {
  default = "t2.micro"
}

