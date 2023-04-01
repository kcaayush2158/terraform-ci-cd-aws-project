output "instance" {
    value = aws_instance.instance
}

output "ami" {
    value = aws_instance.instance.ami
  
}