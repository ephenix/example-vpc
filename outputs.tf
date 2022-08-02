output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = [
    aws_subnet.az1.id,
    aws_subnet.az2.id
  ]
}