resource "aws_subnet" "ansible_subnet" {
  vpc_id     = aws_vpc.Ansible_Vpc.id
  cidr_block = var.cidr_block

  tags = var.subnet_tags
}