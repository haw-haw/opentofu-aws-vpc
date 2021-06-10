# terraform-aws-vpc
## please add below code
This module creates VPC with 3 public subnets ,3 private subnets ,IG and NAT.


```


module "t-vpc" {
  source = "Taherasharifi/vpc/aws"
  
  version = " "  #specify a version 

region = "us-east-1"
vpc_name = "main_vpc"
cider_block = "10.0.0.0/16"
map_public_ip_on_launch = true


cidr-block-private-subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"] 
cidr-block-public-subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"] 

private-subnet-names = ["private1", "private2", "private3"]
public-subnet-names  = ["public1", "public2", "public3"]

private-route-table-name = "private_rout_table"
public-route-table-name  = "Public_rout_table"

  igw-name = "IGW"
  ngw-name = "NGW"

}

# -----------outputs-----------------
output  region {
    value = module.t-vpc.region
}

    output "vpc_id" {
        value = module.t-vpc.vpc-info
    }

    output "public_subnet1" {
        value = module.t-vpc.public_subnets[0]
    }
    output "public_subnet2" {
        value = module.t-vpc.public_subnets[1]
    }
    output "public_subnet3" {
        value = module.t-vpc.public_subnets[2]
    }


    
    output "private_subnet1" {
        value = module.t.private_subnets[0]
    }
     output "private_subnet2" {
        value = module.t.private_subnets[1]
    }
     output "private_subnet3" {
        value = module.t.private_subnets[2]
    }



```