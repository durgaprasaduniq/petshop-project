terraform {
   required_providers {
	aws = {
	source = "hashicorp/aws"
}
}
}

provider "aws" {
  region = "ap-south-2"
}


resource "aws_instance" "myserver" {
  ami = "ami-0aa31b568c1e8d622"
 instance_type = "t3.large"
 key_name = "DEVOPS"

tags = {
  Name = "ansible"
}

provisioner "local-exec" {
   command = <<EOT
  sleep 60
 sudo ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.private_ip}',playbook.yml ec2-user --private-key /home/ec2-user/ansible/.ssh/mykey.pem

EOT
}
}
