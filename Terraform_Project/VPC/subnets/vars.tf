variable "cidr_block" {
  default = "192.168.1.0"
  type = string
}

variable "subnet_tags" {
    type = map(string)
    default = {
      "name" = "ansible"
    }
}