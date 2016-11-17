variable "key_name"         {}
variable "udfw-ami"     {}
variable "udfwIP"       {}
variable "defaultplatform"  {}
variable "subnet_private_1" {}

resource "aws_instance" "udfw" {
  ami = "${var.udfw-ami}"
  instance_type = "${var.defaultplatform}"
  associate_public_ip_address = true
  subnet_id = "${var.subnet_private_1}"
  private_ip = "${var.udfwIP}"
  security_groups = ["${aws_security_group.udfw.id}"]
  key_name = "${var.key_name}"
  tags {
    Name  = "${var.project} UDF"
    Scope = "${var.scope}"
  }
}
