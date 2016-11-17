variable "vpc_cidr_block" {}
variable "vpc_id"  {}
variable "zonea"   {}
variable "zoneb"   {}
variable "project" {}
variable "scope"   {}

# ------------------ Public Subnets in two Zones -----------------------------
#
# Public Subnet in Zone A

resource "aws_subnet" "public_A" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 1, 0)}"
    availability_zone       = "${var.zonea}"
    map_public_ip_on_launch = true
    tags { 
       Name = "${var.project} Public Zone A"
       Scope = "${var.scope}"
    }
}

#  Public Subnet in Zone B

resource "aws_subnet" "public_B" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 1, 1)}"
    availability_zone       = "${var.zoneb}"
    map_public_ip_on_launch = true
    tags {
       Name = "${var.project} Public Zone B"
       Scope = "${var.scope}"
    }
}
