variable "vpc_cidr" {
  type = string
  default = "192.168.0.0"
  description = "Creating a VPC"
}

variable "subnet_cidr" {
  type = string
  default = "198.0.1.0"
}

variable "subnet_tags" {
  type = map(string)
  default = {
    "name" = "ansible_subnet"
  }
}