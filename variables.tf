variable "region" {
  description = "The AWS region to create resources in"
  default     = "eu-north-1"
}

variable "availability_zones" {
  description = "List of availability zones in the region"
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "example-app"
}

variable "prod_instance_type" {
  description = "EC2 instance type for production nodes"
  default     = "t3.medium"
}

variable "prod_desired_size" {
  description = "Desired number of production nodes"
  default     = 1
}

variable "prod_min_size" {
  description = "Minimum number of production nodes"
  default     = 1
}

variable "prod_max_size" {
  description = "Maximum number of production nodes"
  default     = 6
}

variable "dev_instance_type" {
  description = "EC2 instance type for development nodes"
  default     = "t3.small"
}

variable "dev_desired_size" {
  description = "Desired number of development nodes"
  default     = 1
}

variable "dev_min_size" {
  description = "Minimum number of development nodes"
  default     = 1
}

variable "dev_max_size" {
  description = "Maximum number of development nodes"
  default     = 2
}

variable "domain_name" {
  description = "The domain name for the application"
  default     = "*.madaebes.com"
}

# variable "route53_zone_id" {
#   description = "The Route53 hosted zone ID for the domain"
#   default     = "Z0774762S1JVJXZY6L53"
# }



# variable "health_check_path" {
#   description = "The path used for health checks"
#   type        = string
#   default     = "/health"
# }

# variable "certificate_arn" {
#   description = "The ARN of the ACM certificate for HTTPS"
#   type        = string
#   default     = "arn:aws:acm:eu-north-1:654654187204:certificate/c7e5d5cb-d7be-436e-a226-edbfeed085d1"
# }

# variable "cf_certificate_arn" {
#   description = "The ARN of the ACM certificate for HTTPS"
#   type        = string
#   default     = "arn:aws:acm:us-east-1:654654187204:certificate/819d9eab-4201-4344-96a5-c6a51bec2604"
# }


variable "public_subnets" {
  description = "List of public subnet CIDRs"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "key_name" {
  description = "EC2 Key pair name"
  type        = string
  default     = "example-app"  
}