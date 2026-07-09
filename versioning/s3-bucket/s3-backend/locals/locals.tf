locals {
  cpu_map = {
      test = "t3.medium"
      dev  = "t3.micro"
      prod = "t2.large"
}

  owner_map = {
        test = "testproject"
        dev  = "devopsproject"
        prod = "prodproject"
}
cpu =   lookup (local.cpu_map,terraform.workspace,"t3.small")
owner = lookup (local.owner_map,terraform.workspace,"durga")
}
