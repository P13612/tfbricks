variable "project" {}
variable "scope"   {}
variable "paloalto" {}
variable "vpncidr" {}

module "vpn" {
  source = "github.com/P13612/AWSBRICKS//MODULES/vpn/two_zones/two_subnets/private"
  vpc_id = "${module.vpc.vpc_id}"
  subnet_private_1 = "${module.private.subnet_private_1}"
  subnet_private_2 = "${module.private.subnet_private_2}"
  paloalto = "${var.paloalto}"
  vpncidr  = "${var.vpncidr}"
  project = "${var.project}"
  scope   = "${var.scope}"
}
