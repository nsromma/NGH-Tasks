resource "aws_vpc" "ntk-task-vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    name = "dev"
  }
}

resource "aws_subnet" "ntk-public-subnet" {
  vpc_id                  = aws_vpc.ntk-task-vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"

  tags = {
    name = "Dev-public"
  }

}

resource "aws_internet_gateway" "ntk-igw" {
  vpc_id = aws_vpc.ntk-task-vpc.id

  tags = {
    name = "Dev-igw"
  }
}

resource "aws_route_table" "ntk-rt" {
  vpc_id = aws_vpc.ntk-task-vpc.id

  tags = {
    name = "Dev-rt"
  }

}
resource "aws_route" "ntk-route" {
  route_table_id         = aws_route_table.ntk-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ntk-igw.id

}
resource "aws_route_table_association" "ntk-rt-assoc" {
  subnet_id      = aws_subnet.ntk-public-subnet.id
  route_table_id = aws_route_table.ntk-rt.id

}
resource "aws_security_group" "ntk-sg" {
  name        = "Dev-sg"
  description = "Dev security group"
  vpc_id      = aws_vpc.ntk-task-vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = var.http_port
    to_port     = var.http_port
    cidr_blocks = var.ips
  }
  ingress {
    protocol    = "tcp"
    from_port   = var.https_port
    to_port     = var.https_port
    cidr_blocks = var.ips
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "ntk-auth" {
    key_name = "ntk-key"
    public_key = file("~/.ssh/ntk-key.pub") #The change of name affected this so check it out when you want the ecs instance to be running.
}
resource "aws_instance" "ntk-instance" {
    instance_type = "t2.micro"
    ami = data.aws_ami.ntk-server.id

    key_name = aws_key_pair.ntk-auth.id
    vpc_security_group_ids = [aws_security_group.ntk-sg.id] 
    subnet_id = aws_subnet.ntk-public-subnet.id
    user_data = file("userdata.tpl")

}