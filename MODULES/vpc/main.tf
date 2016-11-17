variable vpc_cidr_block  {}
variable project {}
variable scope {}

resource "aws_vpc" "vpc" {
    cidr_block = "${var.vpc_cidr_block}"
    instance_tenancy = "default"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags {
       Name = "${var.project}"
       Scope = "${var.scope}"
    }
}
