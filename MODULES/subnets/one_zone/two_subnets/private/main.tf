variable "vpc_cidr_block" {}
variable "vpc_id"  {}
variable "zonea"   {}
variable "project" {}
variable "scope"   {}

# ------------------ Two Private Subnets in one Zone -----------------------------
#
# Single Private Subnet in one Zone

resource "aws_subnet" "private_1" {
    vpc_id                  = "${var.vpc_id}"
    cidr_block              = "${cidrsubnet("${var.vpc_cidr_block}", 1, 0)}"
    availability_zone       = "${var.zonea}"
    tags {
       Name = "${var.project} Private"
       Scope = "${var.scope}"
    }
}
