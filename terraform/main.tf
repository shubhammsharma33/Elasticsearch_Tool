module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "main-vpc"
}
module "subnet" {
  source              = "./modules/subnet"
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  az                  = "ap-south-1a"
  public_subnet_name  = "public-subnet"
  private_subnet_name = "private-subnet"
}
module "networking" {
  source           = "./modules/networking"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.subnet.public_subnet_id
}
module "security_group" {
  source        = "./modules/security_group"
  vpc_id        = module.vpc.vpc_id
  sg_name       = "main-sg"
  sg_description = "Allow SSH, HTTP, and Elasticsearch"
}
module "ec2" {
  source         = "./modules/ec2"
  ami_id         = "ami-021a584b49225376d"          
  instance_type  = "t2.micro"
  subnet_id      = module.subnet.public_subnet_id   
  sg_id          = module.security_group.sg_id
  key_name       = "my-ec2-key"             
  instance_name  = "es-server"
}

