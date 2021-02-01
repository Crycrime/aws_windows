resource "aws_instance" "ec2_in_2a" {
  ami                    = "ami-019b399cca02b2cd3"
  instance_type          = "t2.micro"
  key_name               = "terraform_for"
  subnet_id              = aws_subnet.pub_subnet_2a.id
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  user_data              = file("user_data.ps")
  get_password_data      = "true"

  connection {
    password = rsadecrypt(self.password_data, file("/home/crycrime/.ssh/aws/terraform_for.pem"))
  }

  tags = {
    Name = "Instance 1"
  }
}

resource "aws_instance" "ec2_in_2b" {
  ami                    = "ami-019b399cca02b2cd3"
  instance_type          = "t2.micro"
  key_name               = "terraform_for"
  subnet_id              = aws_subnet.pub_subnet_2a.id
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  user_data              = file("user_data2.ps")
  get_password_data      = "true"

  connection {
    password = rsadecrypt(self.password_data, file("/home/crycrime/.ssh/aws/terraform_for.pem"))
  }

  tags = {
    Name = "Instance 2"
  }
}
