# main file

module "aws_vpc_module" {
  source = "./modules/aws-vpc"
  for_each = var.vpc_config
  vpc_cidr_block = each.value.vpc_cidr_block
  tags = each.value.tags
}

module "aws_subnet_module"{
    source = "./modules/aws-subnet"
    for_each = var.subnet_config
    availability_zone = each.value.availability_zone
    cidr_block = each.value.cidr_block
    vpc_id = module.aws_vpc_module[each.value.vpc_name].vpc_id
    tags = each.value.tags
}

module "aws_security_group_module" {
    source = "./modules/aws-security-group"  

}

module "aws_nic_module"{
    source = "./modules/aws-nic"
}

module "aws_instance_module"{
    source = "./modules/aws-instance"
}

module "aws_internet_gateway_module"{
    source = "./modules/aws-internetGW"
    vpc_id = ""
    tags = ""
}

module "aws_route_table_association_module"{
    source = "./modules/aws_route_table_association"
    vpc_id = ""
    tags = ""
}

