output "scp_id" {
  description = "SCP id."
  value       = aws_organizations_policy.scp.id
}

output "scp_arn" {
  description = "SCP arn."
  value       = aws_organizations_policy.scp.arn
}
