provider "aws" {
  region  = "us-east-1"
}

output "DNS" {
    value = "${aws_instance.ambDocker.public_dns}"
}

