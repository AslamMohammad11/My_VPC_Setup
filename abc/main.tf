provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

resource "aws_instance" "my_instance" {
  ami           = var.ami_id 
  instance_type = var.instance_type
  key_name = "key_pair"
  subnet_id = module.vpc.public_subnet_id
  vpc_security_group_ids =[module.vpc.security_group_id]
  associate_public_ip_address = true
  root_block_device {
    volume_size = var.root_volume_size
  }
  tags = {
    Name = "ExampleInstance"
  }
}