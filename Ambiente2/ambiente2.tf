
resource "aws_instance" "amb2-1" {
  ami = var.amis["ubuntu"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "amb2.1"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "amb2-2" {
  ami = var.amis["ubuntu"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "amb2.2"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_db_instance.postgres]
}