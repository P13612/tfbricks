output "subnet_private_1" {
    value = "${aws_subnet.private_1.id}"
}

output "subnet_private_2" {
    value = "${aws_subnet.private_2.id}"
}

output "subnet_private_1_cidr" {
  value = "${data.template_file.cidr1A.rendered}"
}

output "subnet_private_2_cidr" {
  value = "${data.template_file.cidr2B.rendered}"
}

