# data "aws_s3_bucket_object" "process_data_zip" {
#   bucket = "helper-bucket123"
#   key    = "process_data.zip"
# }

# resource "aws_lambda_function" "lambda_function" {
#   function_name    = "example_lambda_function"
#   role             = aws_iam_role.lambda_execution_role.arn
#   handler          = "helper-resources.process_data.lambda_handler"
#   runtime          = "python3.8"
#   source_code_hash = data.aws_s3_bucket_object.process_data_zip.etag

#   s3_bucket         = "helper-bucket123"
#   s3_key            = "process_data.zip"
#   # source_code_size  = data.aws_s3_bucket_object.process_data_zip.size

#   environment {
#     variables = {
#       S3_BUCKET_NAME = "helper-bucket123"
#     }
#   }
# }

# Create a Lambda function
resource "aws_lambda_function" "lambda_function" {
  function_name    = var.function_name
  role             = aws_iam_role.lambda_execution_role.arn
  handler          = var.handler
  runtime          = var.runtime
  timeout          = var.timeout
  memory_size      = var.memory_size
  s3_bucket        = var.source_bucket
  s3_key           = var.s3_key
 

}
