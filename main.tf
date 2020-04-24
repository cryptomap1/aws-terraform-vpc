
provider "aws" {
  profile    = "default"
  region     = "eu-west-2"
}

resource "aws_vpc" "PacketWorks" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "internal-eu-west-2a" {
  vpc_id = aws_vpc.PacketWorks.id

  availability_zone = "eu-west-2a"
  cidr_block        = cidrsubnet(aws_vpc.PacketWorks.cidr_block, 8, 0)
}

resource "aws_subnet" "internal-eu-west-2b" {
  vpc_id = aws_vpc.PacketWorks.id

  availability_zone = "eu-west-2b"
  cidr_block        = cidrsubnet(aws_vpc.PacketWorks.cidr_block, 8, 1)
}

resource "aws_subnet" "internal-eu-west-2c" {
  vpc_id = aws_vpc.PacketWorks.id

  availability_zone = "eu-west-2c"
  cidr_block        = cidrsubnet(aws_vpc.PacketWorks.cidr_block, 8, 2)
}

resource "aws_instance" "ec2a" {
  ami           = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.internal-eu-west-2a.id
}

resource "aws_instance" "ec2b" {
  ami           = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.internal-eu-west-2b.id
}


resource "aws_instance" "ec2c" {
  ami           = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.internal-eu-west-2c.id
}