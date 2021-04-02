variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_az_count" {
  type        = number
  default     = 2
  description = "How many AZs should the vpc span into"
}

variable "create_bastion" {
  type    = bool
  default = true
}

variable "bastion_ssh_key_name" {
  type    = string
  default = "bastion-access"
}

variable "bastion_ssh_key" {
  type        = string
  description = "SSH key that allows access to bastion. Has to be RSA - AWS doesn't support different types."
}

variable "enable_s3_endpoint" {
  description = "Should be true if you want to provision an S3 endpoint to the VPC"
  type = bool
  default = false
}

variable "tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Topic = "simple_vm"
    Environment = "np"
    ResourceMsanagedBy = "terraform"
    Contact           = "ma@mismail.xyz"
    Heritage          = "repo address"
  }
}
