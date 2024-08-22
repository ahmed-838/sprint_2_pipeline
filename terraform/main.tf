# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

# Create a subnet
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"  
  tags = {
    Name = "main-subnet"
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}

# Create a route table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "main-route-table"
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

# Create a security group
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}

# Launch EC2 instance 1
resource "aws_instance" "instance_1" {
  ami           = "ami-0e86e20dae9224db8" 
  instance_type = "t3.medium"
  subnet_id     = aws_subnet.main.id
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "instance-1"
  }
}

# Launch EC2 instance 2
resource "aws_instance" "instance_2" {
  ami           = "ami-0e86e20dae9224db8"  
  instance_type = "t3.medium"
  subnet_id     = aws_subnet.main.id
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "instance-2"
  }
}

# Launch EC2 instance 3
resource "aws_instance" "instance_3" {
  ami           = "ami-0e86e20dae9224db8"  
  instance_type = "t3.medium"
  subnet_id     = aws_subnet.main.id
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "instance-3"
  }
}
