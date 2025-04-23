resource "aws_iam_user" "iam_user" {
  name = var.username
}

resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.iam_user.name
}

resource "aws_iam_user_login_profile" "credentials" {
  user = aws_iam_user.iam_user.name
  password_length = 6
  password_reset_required = true
}

resource "aws_iam_user_policy" "dev_policies" {
  user = aws_iam_user.iam_user.name
  name = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "iam:ChangePassword",
          "s3:*"
        ]
        Resource = "*"
      }
    ]
  })
}
