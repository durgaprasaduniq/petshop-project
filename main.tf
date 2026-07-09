provider "aws" {
   region = var.region
}

resource "aws_instance" "my_server" {
   ami    = var.ami
  instance_type = var.instance_type
  key_name    = "eks"
 availability_zone = var.availability_zone

   root_block_device {
    volume_size = 30
    volume_type = "gp3"
    encrypted   = true
}
    tags = {
     Name = "terraform-1"
     owner = var.owner
}
}

resource "aws_eip" "my_eip" {
 instance = aws_instance.my_server.id

  tags = {
  Name = "my-new-eip"
}
}

output "ofter_ip" {
 value = aws_instance.my_server.public_ip
}
output "my_eip" {
  value = aws_eip.my_eip.public_ip
}
