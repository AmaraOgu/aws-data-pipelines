# Grant necessary permissions for the Lambda function to write to the Kinesis stream
resource "aws_lambda_permission" "kinesis_permission" {
  statement_id  = "AllowExecutionFromKinesis"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.arn
  principal     = "kinesis.amazonaws.com"
  source_arn    = var.kinesis_data_stream_arn
}

