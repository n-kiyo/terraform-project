resource "aws_instance" "public_web" {
  ami           = "ami-03852a41f1e05c8e4"
  instance_type = "t3.micro"

  subnet_id                   = aws_subnet.public_1a.id
  vpc_security_group_ids      = [aws_security_group.basic.id]
  associate_public_ip_address = true

  key_name = "dev-keypair"

  tags = {
    Name = "terraform-dev-public-web"
  }
}

resource "aws_instance" "private_app" {
  ami           = "ami-03852a41f1e05c8e4"
  instance_type = "t3.micro"

  subnet_id              = aws_subnet.private_1a.id
  vpc_security_group_ids = [aws_security_group.basic.id]

  # Private Subnet なので Public IP は付けない
  associate_public_ip_address = false

  key_name = "dev-keypair"

  tags = {
    Name = "terraform-dev-private-app"
  }
}
