
resource "aws_instance" "amb3" {
  count = 2
  ami = var.amis["ubuntu"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "amb3-${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "amb3-3" {
  ami = var.amis["ubuntu"]
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "amb3-3"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_db_instance.mysql]
}