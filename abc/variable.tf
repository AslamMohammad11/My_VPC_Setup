variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = ""  
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = ""  
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = ""  
}

variable "root_volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 8  
  
}

variable "backend_bucket" {
  description = "The S3 bucket for storing Terraform state"
  type        = string
  default     = "aslammohammad01" 
}