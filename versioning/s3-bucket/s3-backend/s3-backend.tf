terraform {
 backend "s3" {
 bucket = "devopsdurgajob"
 key    = "stored/terraform.tfstate"
 region = "us-east-1"
}
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "my_server" {
  ami               = "ami-098e39bafa7e7303d"
  instance_type     = "t2.large"
  key_name          = "eks"
  availability_zone = "us-east-1a"
}
