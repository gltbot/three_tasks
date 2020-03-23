#simple SSH access
resource "aws_security_group" "shipamax_server_host" {
  name        = "allow allow"
  description = "Allow all inbound traffic"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${element(var.white_listed_entrants, 0)}", "${element(var.white_listed_entrants, 1)}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}
