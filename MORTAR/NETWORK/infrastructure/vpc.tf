variable "vpc_cidr_block" {}
variable "project" {}
variable "scope" {}

module "vpc" {
  source = "github.com/P13612/AWSBRICKS//MODULES/vpc"
  vpc_cidr_block = "${var.vpc_cidr_block}"
  project = "${var.project}"
  scope   = "${var.scope}"
}

