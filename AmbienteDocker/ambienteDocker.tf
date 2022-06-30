resource "aws_instance" "ambDocker" {
  ami = var.amis["ubuntu"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "ambDocker"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

