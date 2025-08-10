variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_public" {
  description = "The ID of the subnet to associate with the VPC"
  type        = string
  default     = "10.0.1.0/24"
  
}