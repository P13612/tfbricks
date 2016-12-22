variable "vpc_cidr_block" {}
variable "vpc_id"         {}
variable "zonea"          {}
variable "project"        {}
variable "scope"          {}

# ------------------ Public Subnets in two Zones -----------------------------
#
# Single Public Subnet in one Zone

resource "aws_subnet" "public_A" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 0, 0)}"
    availability_zone       = "${var.zonea}"
    map_public_ip_on_launch = true
    tags { 
       Name = "${var.project} Public Subnet"
       Scope = "${var.scope}"
    }
}
