output  region {
    value = var.region
}

output  profile {
    value = var.profile
}

output "AZ" {
    value = data.aws_availability_zones.available.names
}

output "vpc-info"{
    value = aws_vpc.main
}

output "public_subnets" {
value =[
     aws_subnet.public_subnet1.id,
     aws_subnet.public_subnet2.id,
    aws_subnet.public_subnet3.id,
]
}

output "private_subnets" {
    value =[
    aws_subnet.private_subnet1.id,
    aws_subnet.private_subnet2.id,
    aws_subnet.private_subnet3.id,]

}

output "security_groups" {
    value = aws_security_group.allow_base
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}
