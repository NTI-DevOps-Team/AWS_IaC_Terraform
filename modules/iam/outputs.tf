# Output for IAM role
output "iam_role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.resource_role.arn
}
output "iam_role_name" {
  description = "The name of the IAM role"
  value       = aws_iam_role.resource_role.name
}
output "iam_role_id" {
  description = "The ID of the IAM role"
  value       = aws_iam_role.resource_role.id
}
# Output for policy attachment
output "iam_policy_attachment_id" {
  description = "The ID of the IAM policy attachment"
  value       = aws_iam_role_policy_attachment.resource_policy.id
}


