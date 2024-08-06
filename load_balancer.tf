# resource "aws_lb" "main" {
#   name               = "example-app-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.lb_sg.id]
#   subnets            = aws_subnet.eks_subnet.*.id

#   enable_deletion_protection = false

#   tags = {
#     Name = "example-app-lb"
#   }
# }

# resource "aws_lb_target_group" "api1" {
#   name     = "example-app-api1-tg"
#   port     = 4401
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.eks_vpc.id

#   health_check {
#     path                = var.health_check_path
#     port                = "4401"
#     protocol            = "HTTP"
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     interval            = 30
#   }
# }

# resource "aws_lb_target_group" "api2" {
#   name     = "example-app-api2-tg"
#   port     = 4402
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.eks_vpc.id

#   health_check {
#     path                = var.health_check_path
#     port                = "4402"
#     protocol            = "HTTP"
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     interval            = 30
#   }
# }

# resource "aws_lb_target_group" "api3" {
#   name     = "example-app-api3-tg"
#   port     = 4403
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.eks_vpc.id

#   health_check {
#     path                = var.health_check_path
#     port                = "4403"
#     protocol            = "HTTP"
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     interval            = 30
#   }
# }

# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.main.arn
#   port              = 443
#   protocol          = "HTTPS"

#   ssl_policy      = "ELBSecurityPolicy-2016-08"
#   certificate_arn = var.certificate_arn

#   default_action {
#     type = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       message_body = "Hello, this is the default action for example-app."
#       status_code  = "200"
#     }
#   }
# }

# resource "aws_lb_listener" "http" {
#   load_balancer_arn = aws_lb.main.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type = "redirect"
#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }
# }

# resource "aws_lb_listener_rule" "api1" {
#   listener_arn = aws_lb_listener.https.arn
#   priority     = 10

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.api1.arn
#   }

#   condition {

#     path_pattern {
#       values = ["/dashboard*"]
#     }
#   }
# }

# resource "aws_lb_listener_rule" "api2" {
#   listener_arn = aws_lb_listener.https.arn
#   priority     = 20

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.api2.arn
#   }

#   condition {

#     path_pattern {
#       values = ["/ex1*"]
#     }
#   }
# }

# resource "aws_lb_listener_rule" "api3" {
#   listener_arn = aws_lb_listener.https.arn
#   priority     = 30

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.api3.arn
#   }

#   condition {

#     path_pattern {
#       values = ["/ex2*"]
#     }
#   }
# }
