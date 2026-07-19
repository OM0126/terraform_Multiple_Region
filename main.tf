provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "server1" {
ami           = "ami-0c02fb55956c7d316"
instance_type = "t2.micro"

tags = {
Name = "Server1"
}
}

resource "aws_instance" "server2" {
ami           = "ami-0c02fb55956c7d316"
instance_type = "t2.micro"

tags = {
Name = "Server-2"
}
}
