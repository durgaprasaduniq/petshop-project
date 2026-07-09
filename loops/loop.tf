terraform {
  required_providers {
      aws = {
}
}
}
provider "aws" {
  region = "ap-south-2"
}
 
resource "aws_instance" "newinstance" {
  ami = "ami-04e44fc07a0954cc9"
 for_each = var.servers
 instance_type = each.value
 key_name = "durga"

 tags = {
 Name = "myserver-${each.key}"
}
}
