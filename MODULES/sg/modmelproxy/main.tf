variable "vpc_id" {}
variable "vpc_cidr_block" {}

resource "aws_security_group" "modmelproxy" {
  name = "Reverse Proxy with CES and User Defined Firewall"
  description = "Restrict access to sshd to reconfigured Port 22222"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 22222
      to_port = 22222
      protocol = "tcp"
      cidr_blocks = ["${var.vpc_cidr_block}"]
  }
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
