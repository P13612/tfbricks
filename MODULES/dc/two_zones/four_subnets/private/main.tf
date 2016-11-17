variable "vpc_id"       {}
variable "subnet_private_1" {}
variable "project"      {}
variable "scope"        {}

resource "aws_vpn_gateway" "vgw" {
    vpc_id = "${var.vpc_id}"
    tags {
       Name  = "${var.project} VPN direct connect to SNX"
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

resource "aws_route" "default" {
    route_table_id = "${aws_route_table.vgwrouter.id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_vpn_gateway.vgw.id}"
    depends_on = ["aws_route_table.vgwrouter"]
}

resource "aws_iam_role" "OrangeBVPNGRole" {
    name = "OrangeBVPNGRole"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "990137965665"
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "OrangeBVPNGPolicy" {
    name = "OrangeBVPNGPolicy"
    role = "${aws_iam_role.OrangeBVPNGRole.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "directconnect:Confirm*",
        "directconnect:CreatePrivateVirtualInterface",
        "directconnect:CreatePublicVirtualInterface",
        "directconnect:DeleteVirtualInterface",
        "directconnect:Describe*"
      ],
      "Resource": [
        "*"
      ],
      "Effect": "Allow"
    }
  ]
}
EOF
}

