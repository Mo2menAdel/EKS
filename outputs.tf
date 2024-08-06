output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "cluster_security_group_id" {
  value = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}

# output "load_balancer_dns" {
#   description = "The DNS name of the load balancer"
#   value       = aws_lb.main.dns_name
# }

#output "cloudfront_domain_name" {
#  description = "The domain name of the CloudFront distribution"
#  value       = aws_cloudfront_distribution.cdn.domain_name
#}


#output "acm_certificate_arn" {
 # value = aws_acm_certificate.main.arn
#}
