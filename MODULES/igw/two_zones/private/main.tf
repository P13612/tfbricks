variable "vpc_id" {}
variable "vgwrouter_id" {}
variable "project" {}
variable "scope"   {}


resource "aws_internet_gateway" "webgw" {
    vpc_id = "${var.vpc_id}"
    tags {
       Name  = "${var.project} IGW"
       Scope = "${var.scope}"
    }
}

#
# here you will find no router. The router belongs 
# to private gateways either DC or VPN.
# You will find no subnet association as well. This
# is done in private gatewas DC or VPN
#

resource "aws_route" "toigw" {
    route_table_id = "${var.vgwrouter_id}"
    destination_cidr_block = "10.130.0.0/16"
    gateway_id = "${aws_internet_gateway.webgw.id}"
}

