#provider "aws" {
 # region = "eu-south-1"
#}
# Create a new  elastic load balancer
resource "aws_elb" "Ansible_worker1" {
  name               = var.elb_name
  availability_zones = var.AZ
  listener {
    instance_port     = 1337
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 1337
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"

  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:1337/"
    interval            = 30
  }

  instances                   = aws_instance.Ansible_instance.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = var.tags
}