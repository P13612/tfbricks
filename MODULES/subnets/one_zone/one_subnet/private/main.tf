variable "vpc_cidr_block" {}
variable "vpc_id"  {}
variable "zonea"   {}
variable "project" {}
variable "scope"   {}

# ------------------ Private Subnets in two Zones -----------------------------
#
# Single Private Subnet in one Zone

resource "aws_subnet" "private_A" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 0, 0)}"
    availability_zone       = "${var.zonea}"
    tags {
       Name = "${var.project} Private Subnet"
       Scope = "${var.scope}"
    }
}
