variable "tags" {
  type = map(any)
  default = {
    "key" = "ansible"
  }
}

variable "ami_id" {
  type = string
  default = "ami-03a68febd9b9a5403"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}
variable "ssh-key-name" {
  type = string
  default = "ansible_key"
}
variable "privatekeypath" {
  type = string
  default = "./ansible_key.pem"
}