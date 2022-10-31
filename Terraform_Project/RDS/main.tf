resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = var.db_engine
  engine_version       = var.db_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true
  connection { 
  }
}

resource "aws_security_group" "Ansible_ssh" {
  name        = "Ansible_ssh"
  description = "Allow TLS inbound traffic"
  vpc_id      = "/../aws_vpc.Ansible_Vpc.id"

  ingress = [{
    description      = "TLS from VPC"
    from_port        = var.Application_port
    to_port          = var.Application_port
    protocol         = "tcp"
    cidr_blocks      = ["../aws_vpc.Ansible_Vpc.cidr_block"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = [""]
    security_groups = ""
    self = true
  },
  {
    description      = "TLS from VPC"
    from_port        = 1337
    to_port          = 1337
    protocol         = "tcp"
    cidr_blocks      = ["../aws_vpc.Ansible_Vpc.cidr_block"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = [""]
    security_groups = ""
    self = true
  },
  ]

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = [""]
    security_groups = ""
    self = true
  }

  tags = var.tags
}