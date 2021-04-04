variable "tags" {
  description = "Tags to apply to resources created"
  type        = map(string)
  default = {
    Topic = "simple-vm"
    Environment = "np"
    ResourceMsanagedBy = "terraform"
    Contact           = "ma@mismail.xyz"
    Heritage          = "repo address"
  }
}
variable "instance_type" {
  default = "t3.nano"
}

variable "pub_key" {}