# These outputs will display the ARN and name of the S3 bucket created by the Terraform configuration.

# Output the S3 bucket arn
output "bucket_arn" {
  value = aws_s3_bucket.s3_bucket.arn
}


# Output the S3 bucket name
output "s3_bucket_name" {
  value = aws_s3_bucket.s3_bucket.bucket
}