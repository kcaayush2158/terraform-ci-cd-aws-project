
vpc_config = {
    vpc01 = {
        vpc_cidr_block = "192.168.0.0/16"
        tags = {
            "Name": "my_vpc"
        }
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


internet-gateway_config = {
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