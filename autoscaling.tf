resource "aws_autoscaling_policy" "prod_scale_up" {
  name                   = "prod-scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_eks_node_group.prod_nodes.resources[0].autoscaling_groups[0].name
}

resource "aws_autoscaling_policy" "prod_scale_down" {
  name                   = "prod-scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_eks_node_group.prod_nodes.resources[0].autoscaling_groups[0].name
}

resource "aws_autoscaling_policy" "dev_scale_up" {
  name                   = "dev-scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_eks_node_group.dev_nodes.resources[0].autoscaling_groups[0].name
}

resource "aws_autoscaling_policy" "dev_scale_down" {
  name                   = "dev-scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_eks_node_group.dev_nodes.resources[0].autoscaling_groups[0].name
}
