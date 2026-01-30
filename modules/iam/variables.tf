#variables for IAM role
variable "resource_name" {
  description = "The name of the IAM role"
  type        = string
}
variable "policy_version" {
  description = "The version of the IAM policy"
  type        = string
  default     = "2012-10-17"
}
variable "statement" {
  description = "The statement for the IAM policy"
  type = list(object({
    Action   = list(string)
    Effect   = string
    Resource = list(string)
  }))
}

# Variables for policy ARN
variable "policy_arn" {
  description = "The ARN of the policy to attach to the IAM role"
  type        = string
}

