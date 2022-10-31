variable "db_name" {
  type = string  
  default = "mydb"
}

variable "db_engine" {
  type = string
  default = "postgresql"
}

variable "db_version" {
  type = string
  default = "5.7"
}

variable "instance_class" {
  type = string
  default = "db.t3.micro"
}

variable "username" {
  type = string
  default = "ansible"
}

variable "password" {
  type = string
  default = "ansible"
}

variable "parameter_group_name" {
  type = string
  default = "default.mysql5.7"
}

variable "tags" {
    type = map(string)
    default = {
        "name" =  "ansible"
    }
}

variable "Application_port" {
  type = number
  description = "Specify the application port you want to Deploy"
}