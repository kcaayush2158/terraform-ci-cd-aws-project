#main file

module "vpc_name" {
  source = "./modules/aws-vpc"
  for_each = var.vpc_config
  vpc_cidr_block = each.value.vpc_cidr_block
  tags = each.value.tags
}

module "subnet"{
    source = "./modules/aws-subnet"
    for_each = var.subnet_config
    availability_zone = each.value.availability_zone
    cidr_block = each.value.cidr_block
    vpc_id = each.value.availability_zone
    tags = each.value.tags
}


module "security_group" {
    source = "./modules/security_group"  
}

module "nic"{
    source = "./modules/nic"
}

module "instance"{
    source = "./modules/instance"
}

