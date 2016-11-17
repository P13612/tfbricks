variable "vpc_cidr_block" {}
variable "project" {}
variable "scope" {}

variable "dbinstance" {
  default = "db.t2.large"
  description = "the database machine"
}
variable "dbname" {
  default = "mydb"
  description = "the database name"
}
variable "dbsize" {
  default = "5"
  description = "100GB. Smaller makes it slower."
}
variable "dbuser" {
  default = "dbuser"
  description = "the database user"
}
variable "dbpasswd" {
  default = "dbuser213"
  description = "the database password"
}

module "mysqlsimple" {
  source = "github.com/P13612/tfbricks//MODULES/rds/mysql/one_zone/private"
  subnet_private_1 = "${module.private.subnet_private_1}"
  vpc_cidr_block = "${var.vpc_cidr_block}"
  vpc_id  = "${module.vpc.vpc_id}"
  dbinstance = "${var.dbinstance}"
  dbname     = "${var.dbname}"
  dbsize     = "${var.dbsize}"
  dbuser     = "${var.dbuser}"
  dbpasswd   = "${var.dbpasswd}"
  project    = "${var.project}"
  scope      = "${var.scope}"
}

