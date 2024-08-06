# resource "aws_security_group" "lb_sg" {
#   name        = "load-balancer-sg"
#   description = "Security group for load balancer"
#   vpc_id      = aws_vpc.eks_vpc.id

#   ingress {
#     description = "Allow HTTPS traffic"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Allow HTTP traffic"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description = "Allow all outbound traffic"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-instances-sg"
  description = "Security group for EC2 instances"
  vpc_id      = aws_vpc.eks_vpc.id

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
