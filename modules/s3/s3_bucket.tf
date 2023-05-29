# Define a random ID to append to the S3 bucket name for uniqueness
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Create an S3 bucket with a unique name based on the provided `bucket_name` 
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.bucket_name}-${random_id.bucket_suffix.hex}"
  force_destroy = true
}

# Enable ownership controls on the S3 bucket to specify the preferred owner of objects
resource "aws_s3_bucket_ownership_controls" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Set the S3 bucket access control list (ACL) to private
resource "aws_s3_bucket_acl" "s3_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket] # Wait for the ownership controls to be applied before setting the ACL
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

