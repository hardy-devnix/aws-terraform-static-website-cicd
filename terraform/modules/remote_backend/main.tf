data "aws_caller_identity" "current" {}

# S3 Bucket for Terraform state
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = var.bucket_name
  }
}

# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "versioning_enabled" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# S3 Bucket Policy
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:ListBucket",
        Resource = aws_s3_bucket.terraform_state_bucket.arn,
        Principal = {
          AWS = data.aws_caller_identity.current.arn
        }
      },
      {
        Effect   = "Allow",
        Action   = ["s3:GetObject", "s3:PutObject"],
        Resource = "${aws_s3_bucket.terraform_state_bucket.arn}/*",
        Principal = {
          AWS = data.aws_caller_identity.current.arn
        }
      }
    ]
  })
}

# DynamoDB Table for state locking
resource "aws_dynamodb_table" "state_lock_table" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = var.table_name
  }
}