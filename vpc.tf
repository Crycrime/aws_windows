provider "aws" {
  profile = "crycrime"
  region  = "eu-west-2"

}

resource "aws_vpc" "test_vpc" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "Test vpc"
  }
}
