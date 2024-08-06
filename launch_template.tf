resource "aws_launch_template" "eks_launch_template" {
  name          = "eks-launch-template"
  image_id      = data.aws_ami.eks_worker.id
  

  lifecycle {
    create_before_destroy = true
  }

  key_name = var.key_name
  
}

data "aws_ami" "eks_worker" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amazon-eks-node-*"]
  }

  owners = ["602401143452"] # Amazon EKS AMI account ID
}
