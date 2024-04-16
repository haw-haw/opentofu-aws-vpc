locals {
    ports = [22, 80, 443]
}

resource "aws_security_group" "allow_base" {
  name        = "allow_base"
  description = "Allow basic inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_base"
  }
}

for (port in local.ports) {
  resource "aws_vpc_security_group_ingress_rule" "allow_base_${port}_ipv4" {
    security_group_id = aws_security_group.allow_base.id
    cidr_ipv4         = "0.0.0.0/0"
    from_port         = ${port}
    ip_protocol       = "tcp"
    to_port           = ${port}
  }

  resource "aws_vpc_security_group_ingress_rule" "allow_base_${port}_ipv6" {
    security_group_id = aws_security_group.allow_base.id
    cidr_ipv6         = "::/0"
    from_port         = ${port}
    ip_protocol       = "tcp"
    to_port           = ${port}
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_base_IPs_ipv4" {
  security_group_id = aws_security_group.allow_base.id
  cidr_ipv4         = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_base.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.allow_base.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
