provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_server" {
  ami               = "ami-098e39bafa7e7303d"
  instance_type     = local.cpu
  key_name          = "eks"
  availability_zone = "us-east-1a"

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = "terraform-1"
    owner = local.owner
  }
}

