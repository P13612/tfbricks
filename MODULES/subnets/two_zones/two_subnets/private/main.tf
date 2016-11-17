variable "vpc_cidr_block" {}
variable "vpc_id"  {}
variable "zonea"   {}
variable "zoneb"   {}
variable "project" {}
variable "scope"   {}

# ------------------ Private Subnets in two Zones -----------------------------
#
# Private Subnet in Zone A

resource "aws_subnet" "private_A" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 1, 0)}"
    availability_zone       = "${var.zonea}"
    tags {
       Name = "${var.project} Private Zone A"
       Scope = "${var.scope}"
    }
}

#  Private Subnet B in Zone B

resource "aws_subnet" "private_B" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 1, 1)}"
    availability_zone       = "${var.zoneb}"
    tags { 
       Name = "${var.project} Private Zone B"
       Scope = "${var.scope}"
    }
}
