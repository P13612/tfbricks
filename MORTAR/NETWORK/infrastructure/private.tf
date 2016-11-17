variable "vpc_cidr_block" {}
variable "zonea"   {}
variable "zoneb"   {}
variable "project" {}
variable "scope"   {}

module "private" {
  source  = "github.com/P13612/AWSBRICKS//MODULES/subnets/two_zones/two_subnets/private"
  vpc_cidr_block = "${var.vpc_cidr_block}"
  vpc_id  = "${module.vpc.vpc_id}"
  zonea   = "${var.zonea}"
  zoneb   = "${var.zoneb}"
  project = "${var.project}"
  scope   = "${var.scope}"
}
