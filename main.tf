
module "aws_vpc_module" {
  source         = "./modules/aws-vpc"
  for_each       = var.vpc_config
  vpc_cidr_block = each.value.vpc_cidr_block
  tags           = each.value.tags
}

module "aws_subnet_module" {
  source            = "./modules/aws-subnet"
  for_each          = var.subnet_config
  availability_zone = each.value.availability_zone
  cidr_block        = each.value.cidr_block
  vpc_id            = module.aws_vpc_module[each.value.vpc_name].vpc_id
  tags              = each.value.tags
}

module "aws_security_group_module" {
  source   = "./modules/aws-security-group"
  for_each = var.aws_security_group_config
  tags     = var.tags
  ingress = {
    description      = each.value.description
    from_port        = each.value.from_port
    to_port          = each.value.to_port
    protocol         = each.value.protocol
    cidr_blocks      = each.value.cidr_blocks
    ipv6_cidr_blocks = each.value.ipv6_cidr_blocks
  }

  egress = {
    from_port        = each.value.from_port
    to_port          = each.value.to_port
    protocol         = each.value.protocol
    cidr_blocks      = each.value.cidr_block
    ipv6_cidr_blocks = each.value.ipv6_cidr_blocks
  }
}

module "aws_nic_module" {
  source = "./modules/aws-nic"
}

module "aws_ec2_instance_module" {
  source        = "./modules/aws-ec2_instance"
  for_each      = var.aws_instance_config
  instance_type = var.key.instance_type
  tags          = each.key.tags
  ami           = each.key.ami

}

module "aws_internet_gateway_module" {
  source   = "./modules/aws-internetGW"
  for_each = var.internet_gateway_config
  vpc_id   = each.key.vpc_id
  tags     = each.key.tags
}

module "aws_route_table_association_module" {
  source   = "./modules/aws_route_table_association"
  for_each = var.internet-gateway_config
  vpc_id   = each.key.voc.iGW_01.vpc_name
  tags     = each.key.tags
}

