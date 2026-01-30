#create IAN Role for resources
resource "aws_iam_role" "resource_role" {
  name = "${var.resource_name}-role"

  assume_role_policy = jsonencode({
    Version   = var.policy_version
    Statement = var.statement
  })

  tags = {
    Name = "${var.resource_name}-role"
  }
}

#attach AWS policy to the role
resource "aws_iam_role_policy_attachment" "resource_policy" {
  role       = aws_iam_role.resource_role.id
  policy_arn = var.policy_arn
}
