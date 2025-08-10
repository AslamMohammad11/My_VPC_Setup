output "vpc_id" {
  value = aws_vpc.myvpc.id
  
}

output "public_subnet_id" {
  value = aws_subnet.mysubnet_public_1.id
}

output "security_group_id" {
  value = aws_security_group.mysecuritygroup.id
}