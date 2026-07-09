variable "servers" {
   default = {
     web = "t3.micro"
     dev = "t3.small"
     test = "t3.large"
     proj = "t3.medium"
}
}
