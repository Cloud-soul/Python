variable "instance_type" {
  description = "Enter the instance type for the EC2 instance (e.g., t3.micro, t2.small)"
  type        = string
}

variable "subnet" {
  description = "Enter the Subnet ID where the instance will be launched"
  type        = string
}

variable "key_name" {
  type        = string
  default       = "ec2-key"
}