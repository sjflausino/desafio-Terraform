variable "amis" {
  default = {
      "ubuntu" = "ami-052efd3df9dad4825"
  }
}
variable "key_name" {
  default = "terraform-aws"
}
variable "instance_type" {
  default = "t2.micro"
}

