output "aws_ec2_2a_id" {
  value       = aws_instance.ec2_in_2a.id
  description = "EC2_2 id"
}

output "aws_ec2_2b_id" {
  value       = aws_instance.ec2_in_2b.id
  description = "EC2_2 id"
}

output "test_vpc_id" {
  value       = aws_vpc.test_vpc.id
  description = "VPC id"
}

output "elb_dns_name" {
  value = aws_lb.test_nlb.dns_name
}

output "password_ec2_1" {
  value = aws_instance.ec2_in_2a.password_data
}

output "password_ec2_2" {
  value = aws_instance.ec2_in_2b.password_data
}
