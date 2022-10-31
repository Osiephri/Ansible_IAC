resource "aws_instance" "ansible_instance" {
    
    tags= var.tags
    ami = var.ami_id
    key_name = var.ssh-key-name
    instance_type = var.instance_type
    associate_public_ip_address = true
    security_groups = [ aws_security_group.Ansible_ssh.id ]
    #connection {
     #   type = "ssh"
     #   user = "ec2-user"
     #   #private_key = file(var.privatekeypath)
     #   host = self.public_ip
    #}
    #provisioner "file" {
    #  source = var.privatekeypath
    #  destination = "~/ansible_key.pem"
    #}

   # provisioner "local-exec" {
    #  command = "ssh -ti ${var.privatekeypath} ec2-user@${self.public_ip}"
    #}
}

resource "aws_security_group" "ansible_ssh" {
  name        = "Ansible_ssh"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.Ansible_Vpc.id

  ingress{
    description      = "TCP from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "ssh"
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

