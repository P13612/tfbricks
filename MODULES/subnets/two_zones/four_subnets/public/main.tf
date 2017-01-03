variable "vpc_cidr_block" {}
variable "vpc_id"  {}
variable "zonea"   {}
variable "zoneb"   {}
variable "project" {}
variable "scope"   {}

# ------------------ Two Public Subnets in two Zones -----------------------------
#
# Public Subnet 1 in Zone A

data "template_file" "cidr1A" {
    cidr_block = "${cidrsubnet("${var.vpc_cidr_block}", 2, 2)}"
}

resource "aws_subnet" "public_1" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 2, 2)}"
    availability_zone       = "${var.zonea}"
    map_public_ip_on_launch = true
    tags { 
       Name = "${var.project} Public 1 Zone A"
       Scope = "$var.scope}"
    }
}

#  Public Subnet 2 in Zone B

data "template_file" "cidr2B" {
    cidr_block = "${cidrsubnet("${var.vpc_cidr_block}", 2, 3)}"
}

resource "aws_subnet" "public_2" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 2, 3)}"
    availability_zone       = "${var.zoneb}"
    map_public_ip_on_launch = true
    tags {
       Name = "${var.project} Public 2 Zone B"
       Scope = "${var.scope}"
    }
}
