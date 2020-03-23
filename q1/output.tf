output "bastion-IP" {
  value = "${aws_instance.shipamax_server.public_ip}"
}
