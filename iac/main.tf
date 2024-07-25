provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0a0b7b240264a48d7"
  instance_type = "t3.micro"

  tags = {
    Name = "my-ubuntu"
  }
}
