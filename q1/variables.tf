variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

variable "vpc_cidr" {
  default = "10.9.0.0/16"
}
variable "private_subnets" {
  default = ["10.9.0.0/24", "10.9.1.0/24"]
}
variable "public_subnets" {
  default = ["10.9.10.0/24", "10.9.11.0/24"]
}
variable "sshpubkey_file" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "white_listed_entrants" {
  default = ["87.81.160.225/32", "10.9.0.0/16"]
}

variable "ami" {
  default = "ami-04d5cc9b88f9d1d39"
}


variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
