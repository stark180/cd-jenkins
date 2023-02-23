# Terraform Output Values

# Jenkins EC2 Instance Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.jenkins.public_ip
}

# Jenkins EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.jenkins.public_dns
}
