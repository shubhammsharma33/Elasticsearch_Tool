variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
}

variable "az" {
  description = "Availability zone"
  type        = string
  default     = "ap-south-1a"
}

variable "public_subnet_name" {
  description = "Public subnet name"
  type        = string
  default     = "public-subnet"
}

variable "private_subnet_name" {
  description = "Private subnet name"
  type        = string
  default     = "private-subnet"
}

