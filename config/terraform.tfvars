
vpc_config = {
    vpc01 = {
        vpc_cidr_block = "192.168.0.0/16"
        tags = {
            "Name": "my_vpc"
        }
    }
}

instance_config ={
    instance_01 = {
        name = "my_instance_01"
    }

    instance_02 = {
        name = "my_instance_02"
    }
}

subnet_config = {
    "public-us-east-1a" = {
        cidr_block = "192.168.0.0/18",
        availibity_zone = "us-east-1a",
        tags ={
            "name": "public-us-east-1a"
        }
    }

    "public-us-east-1b" = {
        cidr_block = "192.168.0.0/18",
        availibity_zone = "us-east-01",
        tags ={
            "name": "public-us-east-01"
        }
    }

    "private-us-east-1a" = {
        cidr_block = "192.168.128.0/18",
        availibity_zone = "us-east-01",
        tags ={
            "name": "public-us-east-01"
        }
    }
}


internet_gateway_config = {
    iGW_01 = {
        vpc_name = "vpc01" 
    }
    tags = {
        "Name" = "MY_IGW"
    }
}

aws_routing_table_config = {

    RT_O1 = {
           vpc_name = "vpc01" 
           gateway_name = "igw01"

    tags = {
        "Name" = "Public-Route"
    }

    }

    RT_O1 = {
           vpc_name = "vpc02" 
           gateway_name = "igw02"

    tags = {
        "Name" = "Public-Route"
    }

    }


    RT_O1 = {
           vpc_name = "vpc02" 
           gateway_name = "igw02"

    tags = {
        "Name" = "Private-Route"
    }

    }

}


aws_provider_config = {
        secret_key = ""
        access_key = ""
        region = ""
}


aws_security_group_config ={
     name = "allow_tls"
        description = "Allow TLS inbound traffic"
        vpc_id = aws_vpc.mian.vpc_id
        
     ingress = {
        name = "aws_security_config"
        description= "",
        to_port = 443,
        from_port = 443,
        protocol = "tcp"
        ipv6_cidr_blocks = ""
    }

    engress = {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_tls"
    }

}