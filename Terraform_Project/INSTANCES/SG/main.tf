resource "aws_security_group" "ansible_ssh" {
  name        = "Ansible_ssh"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.Ansible_Vpc.id

  ingress{
    description      = "TLS from VPC"
    from_port        = [443,80]
    to_port          = [443,80]
    protocol         = "tcp"
    cidr_blocks      = ["aws_vpc.Ansible_Vpc.cidr_block"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags
}