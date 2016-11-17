variable "vpc_id" {}
variable "vpc_cidr_block"   {}
variable "subnet_private_1" {}
variable "subnet_private_2" {}
variable "dbinstance" {}
variable "dbname" {}
variable "dbsize" {}
variable "dbuser" {}
variable "dbpasswd" {}
variable "project" {}
variable "scope"   {}

resource "aws_db_instance" "mysql" {
    identifier = "mydb-rds"
    name = "${var.dbname}"
    allocated_storage = "${var.dbsize}"
    engine = "mysql"
    engine_version = "5.7.11"
    instance_class = "${var.dbinstance}"
    port = "3306"
    multi_az = true
    storage_encrypted = true
    allow_major_version_upgrade = false
    auto_minor_version_upgrade = true
    username = "${var.dbuser}"
    password = "${var.dbpasswd}"
    db_subnet_group_name = "${aws_db_subnet_group.dbsubnetgroup.name}"
    vpc_security_group_ids = [ "${aws_security_group.dbsecgrp.id}" ]
    tags {
       Name = "${var.project} MySQL DB"
       Scope = "${var.scope}"
    }
}

resource "aws_db_subnet_group" "dbsubnetgroup" {
    name = "main"
    description = "mysql persistence location"
    subnet_ids = ["${var.subnet_private_1}", "${var.subnet_private_2}"]
    tags {
       Name = "${var.project} DB"
       Scope = "${var.scope}"
    }
}

resource "aws_security_group" "dbsecgrp" {
  description = " Persistance CS"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = ["${var.vpc_cidr_block}"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
    tags {
       Name = "${var.project} mysql service"
       Scope = "${var.scope}"
    }
}