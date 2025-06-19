terraform {
  backend "s3" {
    bucket = "terraform-phn"
    key    = "tools/state"
    region = "us-east-1"
  }
}

variable "ami_id" {
  default = "ami-09e6f87a47903347c"
}

variable "Zone_id"{
  default = "Z00597101WWGD8AB8PV95"
}

variable "tools" {
  default = {

    vault = {
      instance_type = "t3.small"
      port          = 8200
    }
  }
}


module "tool-infra" {
  source   = "./module-infra"
  for_each = var.tools
  ami_id        = var.ami_id
  instance_type = each.value["instance_type"]
  name          = each.key
  port          = each.value["port"]
  zone_id       = var.Zone_id
}
