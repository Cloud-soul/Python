output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.terraform_instance.id
}

output "public_ip" {
  description = "Public IP"
  value       = aws_instance.terraform_instance.public_ip
}

output "security_group_id" {
  description = "Security Group ID"
  value       = tolist(aws_instance.terraform_instance.security_groups)[0]
}

output "vpc_id" {
  description = "VPC ID"
  value       = tolist(aws_instance.terraform_instance.vpc_security_group_ids)[0]
}

output "subnet_id" {
  description = "Subnet ID"
  value       = aws_instance.terraform_instance.subnet_id
}
