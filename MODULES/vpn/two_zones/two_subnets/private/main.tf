variable "vpc_id"       {}
variable "subnet_private_1" {}
variable "subnet_private_2" {}
variable "paloalto"     {}
variable "vpncidr"      {}
variable "project"      {}
variable "scope"        {}

resource "aws_vpn_connection" "vpn" {
    vpn_gateway_id      = "${aws_vpn_gateway.vgw.id}"
    customer_gateway_id = "${aws_customer_gateway.cgw.id}"
    type = "ipsec.1"
    tags {
       Name  = "${var.project} VPN to SNX"
       Scope = "${var.scope}"
    }
    static_routes_only = true
}

resource "aws_vpn_gateway" "vgw" {
    vpc_id = "${var.vpc_id}"
    tags {
       Name  = "${var.project} VPN gateway to SNX"
       Scope = "${var.scope}"
    }
}

resource "aws_customer_gateway" "cgw" {
    type = "ipsec.1"
    ip_address = "${var.paloalto}"
    bgp_asn = "${var.ASN}"
    tags {
       Name  = "${var.project} VPN CGW to Palo Alto"
       VPN   = "Gateway to ${var.paloalto}"
       Scope = "${var.scope}"
    }
}
resource "aws_route_table" "vgwrouter" {
    vpc_id = "${var.vpc_id}"
    tags {
       Name  = "${var.project} VGW Router"
       Scope = "${var.scope}"
    }
}

resource "aws_route_table_association" "vgw2private1" {
    subnet_id      = "${var.subnet_private_1}"
    route_table_id = "${aws_route_table.vgwrouter.id}"
}

resource "aws_route_table_association" "vgw2private2" {
    subnet_id      = "${var.subnet_private_2}"
    route_table_id = "${aws_route_table.vgwrouter.id}"
}

resource "aws_route" "paloalto" {
    route_table_id = "${aws_route_table.vgwrouter.id}"
    destination_cidr_block = "${var.vpncidr}"
    gateway_id = "${aws_vpn_gateway.vgw.id}"
    depends_on = ["aws_route_table.vgwrouter"]
}

resource "aws_route" "default" {
    route_table_id = "${aws_route_table.vgwrouter.id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_vpn_gateway.vgw.id}"
    depends_on = ["aws_route_table.vgwrouter"]
}
