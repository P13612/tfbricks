variable "vpc_cidr_block" {}
variable "zonea"   {}
variable "zoneb"   {}
variable "vpc_id"  {}
variable "project" {}
variable "scope"   {}

# ------------------ Two Private Subnets in two Zones  ---------------
#
# Private Subnet 1 in Zone A

resource "aws_subnet" "private_1" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 2, 0)}"
    availability_zone       = "${var.zonea}"
    tags {
       Name = "${var.project} Private 1 Zone A"
       Scope = "${var.scope}"
    }
}

#  Private Subnet 2 in Zone B

resource "aws_subnet" "private_2" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 2, 1)}"
    availability_zone       = "${var.zoneb}"
    tags { 
       Name = "${var.project} Private 2 Zone B"
       Scope = "${var.scope}"
    }
}
