variable "aws_region" {
  description = "AWS region name"
  type     = string
}
variable "aws_access_key" {
  description = "AWS Access Key"
  type     = string
}
variable "aws_secret_key" {
  description = "AWS Secret Key"
  type     = string
}
variable "vpc_cidr" {
  default = "172.32.32.0/24"
  description = "CIDR block used for the VPC"
  type     = string
}
variable "on_prem_subnet" {
  default = "172.25.0.0/16"
  description = "CIDR block for on-prem network; used for VPN routing and Security Group"
  type     = string
}
variable "any_subnet" {
  default = "0.0.0.0/0"
  description = "CIDR block for on-prem network; used for VPN routing and Security Group"
  type     = string
}
variable "iselab_az" {
  type = list(string)
  default = ["us-east-1a","us-east-1b"]
  description = "Availability Zones referenced in 'vpc.tf' when creating the subnets"
}
variable "iselab_az1" {
  default = "us-east-1a"
  type     = string
}
variable "iselab_az2" {
  default = "us-east-1b"
  type     = string
}
# variable "public_subnets_cidr" {
#   type = list(string)
#   default = ["172.32.32.0/28","172.32.32.112/28"]
# }
variable "private_subnets_cidr" {
  type = list(string)
  default = ["172.32.32.16/28","172.32.32.128/28"]
}
variable "key_name" {
  description = "Name of the key pair created in AWS; used to SSH into the ISE nodes"
  type     = string
}
variable "ise_ami_3_3_us_east_1" {
  default = "ami-0b23511ddfe2744e2"
  type     = string
}
# variable "ise_ami_3_4_us_east_1" {
#   default = "ami-07946ba1cee1ca94a"
#   type = string
# }
variable "ise_instance_type" {
  default = "m5.16xlarge"
  type = string
}
variable "ise_pan_gig0_ip" {
  default = "172.32.32.24"
  type = string
}
variable "ise_san_gig0_ip" {
  default = "172.32.32.132"
  type = string
}
