resource "aws_security_group" "allow_tls" {
  name        =  var.name
  description = var.description
  vpc_id      = var.vpc_id

  ingress {
    description = var.description
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_block
  
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.tags
  }
}