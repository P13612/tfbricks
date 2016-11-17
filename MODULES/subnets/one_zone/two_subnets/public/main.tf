variable "vpc_cidr_block" {}
variable "vpc_id"  {}
variable "zonea"   {}
variable "project" {}
variable "scope"   {}

# ------------------ Two Public Subnets in one Zone -----------------------------
#
# Single Public Subnet in one single zone

resource "aws_subnet" "public_1" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 1, 1)}"
    availability_zone       = "${var.zonea}"
    map_public_ip_on_launch = true
    tags { 
       Name = "${var.project} Public"
       Scope = "${var.scope}"
    }
}
