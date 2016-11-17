output "subnet_private_1" {
    value = "${aws_subnet.private_A.id}"
}

output "subnet_private_2" {
    value = "${aws_subnet.private_B.id}"
}

