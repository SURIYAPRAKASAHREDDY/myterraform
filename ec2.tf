terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  access_key = ""PUT YOUR KEY""
  secret_key = ""PUT YOUR KEY""
}


resource "aws_instance" "surya" {
  ami                     = "ami-06c68f701d8090592"
  instance_type           = "t3.micro"
  

  tags = {
    Name = "surya"
  }

}
