variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = "main-sg"
}

variable "sg_description" {
  description = "Security group description"
  type        = string
  default     = "Allow SSH, HTTP, and Elasticsearch"
}

