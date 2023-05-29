/*
Creates an IAM role for Amazon Kinesis Firehose delivery streams
and sets the policy to allow the Firehose service to assume the role.
*/

resource "aws_iam_role" "firehose_role" {
  name = "my-firehose-role"

 # Allows Firehose service to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "firehose.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Creates an IAM policy that allows Amazon Kinesis Firehose to write data to an S3 bucket and describes the Amazon Kinesis stream.
resource "aws_iam_policy" "firehose_policy" {
  name        = "firehose_s3_policy"
  policy      = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        # Allows Firehose to write data to S3 bucket
        Action   = [
          "s3:AbortMultipartUpload",
          "s3:GetBucketLocation",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:ListBucketMultipartUploads",
          "s3:PutObject"
            ],
        Effect   = "Allow"
        Resource = [
          "${var.bucket_arn}",
          "${var.bucket_arn}/*"
        ]
        # Resource = "*"
      },
      {
        # grants certain permissions related to Kinesis stream operations
        Action   = [
          "kinesis:DescribeStream",
          "kinesis:GetShardIterator",
          "kinesis:GetRecords",
          "kinesis:ListShards"
        ]
        Effect   = "Allow"
        Resource =  "${aws_kinesis_stream.my_stream.arn}"
      }
    ]
  })
}

# Attaches the IAM policy to the previously created IAM role for Firehose.
resource "aws_iam_role_policy_attachment" "firehose_s3_policy_attachment" {
  policy_arn = aws_iam_policy.firehose_policy.arn
  role       = aws_iam_role.firehose_role.name
}

