resource "aws_instance" "shipamax_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = "${element(module.vpc.public_subnets, 0)}"
  vpc_security_group_ids = ["${aws_security_group.shipamax_server_host.id}"]
  key_name               = "my_public_key"
  tags                   = var.tags
}

resource "aws_key_pair" "my_public_key" {
  key_name   = "my_public_key"
  public_key = "${file(var.sshpubkey_file)}"
}
