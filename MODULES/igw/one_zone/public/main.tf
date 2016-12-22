resource "aws_internet_gateway" "webgw" {
    vpc_id = "${var.vpc_id}"
    tags {
       Name  = "${var.project} IGW"
       Scope = "${var.scope}"
    }
}

resource "aws_route_table" "igwrouter" {
    vpc_id = "${var.vpc_id}"
    tags {
       Name  = "${var.project} IGW Router"
       Scope = "${var.scope}"
    }
}

resource "aws_route" "toigw" {
    route_table_id = "${aws_route_table.igwrouter.id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.webgw.id}"
    depends_on = ["aws_route_table.igwrouter"]
}

resource "aws_route_table_association" "igwpublic1" {
    subnet_id      = "${var.subnet_public_1}"
    route_table_id = "${aws_route_table.igwrouter.id}"
}
