variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

variable "project" {
  description = "Use userX format, replace X with your user number. Uncomment default to avoid prompt."
  type        = string
  default     = "user00-2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "deployment_tag" {
  description = "Deployment identifier passed to application layer"
  type        = string
  default     = "v2"
}
