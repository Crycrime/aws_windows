resource "aws_security_group" "allow_http" {
  name        = "allow_http_rdp_winrm"
  description = "Allow HTTP, RDP, WinRM"
  vpc_id      = aws_vpc.test_vpc.id

  dynamic "ingress" {
    for_each = ["80", "3389", "5985", "5986"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow HTTP, RDP, WinRM Security Group"
  }
}
