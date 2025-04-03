terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.91.0"
    }
  }
}

provider "aws" {
  region  = "eu-central-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-05792a34356f4d8fb"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
