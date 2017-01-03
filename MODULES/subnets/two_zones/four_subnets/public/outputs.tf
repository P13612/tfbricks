output "subnet_public_1" {
    value = "${aws_subnet.public_1.id}"
}

output "subnet_public_2" {
    value = "${aws_subnet.public_2.id}"
}


output "subnet_public_1_cidr" {
  value = "${data.template_file.cidr1A.rendered}"
}

output "subnet_public_2_cidr" {
  value = "${data.template_file.cidr2B.rendered}"
}
