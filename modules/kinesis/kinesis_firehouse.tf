# Create a Kinesis Firehose delivery stream to an S3 bucket 
resource "aws_kinesis_firehose_delivery_stream" "kinesis_firehose" {
  name        = var.kinesis_firehose_name
  destination = "extended_s3"

  # Configure the Kinesis stream source with an IAM role and the stream ARN
  kinesis_source_configuration {
    kinesis_stream_arn = aws_kinesis_stream.my_stream.arn
    role_arn           = aws_iam_role.firehose_role.arn
  }

  # Configure the S3 delivery options with an IAM role and the bucket ARN
  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = var.bucket_arn
    
  }

  # Make the Firehose stream depend on the Kinesis stream to ensure proper configuration
  depends_on = [aws_kinesis_stream.my_stream]
}

