variable region {}
variable profile {}
variable cider_block {}
variable vpc_name {}
variable map_public_ip_on_launch {}
variable cidr-block-private-subnets {}
variable cidr-block-public-subnets {}

variable public-subnet-names { 
     type = list(string)
}


variable private-subnet-names { 
     type = list(string)
}

variable private-route-table-name {}
variable public-route-table-name {}
variable igw-name {}
variable ngw-name {}
