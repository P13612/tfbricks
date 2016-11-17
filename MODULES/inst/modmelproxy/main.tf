variable "key_name"         {}
variable "modmelproxy-ami"  {}
variable "modmelproxyIP"    {}
variable "defaultplatform"  {}
variable "subnet_public_1"  {}
variable "sgmodmelproxy"    {}
variable "project"          {}
variable "scope"            {}

resource "aws_instance" "modmelproxy" {
  ami = "${var.modmelproxy-ami}"
  instance_type = "${var.defaultplatform}"
  associate_public_ip_address = true
  subnet_id = "${var.subnet_public_1}"
  private_ip = "${var.modmelproxyIP}"
  security_groups = ["${var.sgmodmelproxy}"]
  key_name = "${var.key_name}"
  tags {
    Name  = "${var.project} proxy with entitlement"
    Scope = "${var.scope}"
  }
}
