# Infrastructure Layer Outputs
# These outputs are consumed by the application layer via terraform_remote_state
# Key concept: Outputs serve as the interface for cross-layer communication

output "security_group_id" {
  description = "ID of the web security group"
  value       = aws_security_group.web_sg.id
}

output "environment" {
  description = "Environment name for use in application layer"
  value       = var.environment
}

output "deployment_tag" {
  description = "Deployment identifier for application layer"
  value       = var.deployment_tag
}

output "db_security_group_id" {
  description = "ID of the db security group"
  value       = aws_security_group.db_sg.id
}