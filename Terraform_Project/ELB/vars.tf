variable "AZ"{
    type = list(string)
    default = ["us-west-2a", "us-west-2b", "us-west-2c"]
}
variable "tags"{
    type = map(string)
    default = {
      "name" = "Ansible"
    }
}