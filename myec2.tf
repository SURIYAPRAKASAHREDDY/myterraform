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
  access_key = "NA please update your access_key"
  secret_key = "NA  please update you secret_key"
}


resource "aws_instance" "surya" {
  ami                     = "update your ami accroding to your region and os"
  instance_type           = "t2.micro"
  
  tags = {
    Name = surya
  }

}

