output "instance_ip" {
  description = "The IP address of the EC2 instance"
  value       = aws_instance.surya.private_ip 

}

output "instance_ID" {
  description = "The IP address of the EC2 instance"
  value       = aws_instance.surya.id

}
