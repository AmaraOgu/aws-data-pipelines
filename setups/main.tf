# Creates an S3 bucket for storing the processed data
module "data-s3-bucket" {
  source      = "../modules/s3"
  bucket_name = var.bucket_name
}

# Creates an Amazon Kinesis data stream to send data from Lambda to S3
module "kinesis" {
  source                 = "../modules/kinesis"
  kinesis_stream_name    = var.kinesis_stream_name
  kinesis_firehose_name  = var.kinesis_firehose_name
  bucket_arn             = module.data-s3-bucket.bucket_arn

  depends_on             = [ module.data-s3-bucket ]
}

# Deploys an lambda function that sends data to the Kinesis stream
module "lamda_function" {
  source                  = "../modules/lambda"
  function_name           = var.function_name
  s3_key                  = var.s3_key
  handler                 = var.handler
  runtime                 = var.runtime
  timeout                 = var.timeout
  memory_size             = var.memory_size
  source_bucket           = var.source_bucket
  kinesis_data_stream_arn = module.kinesis.kinesis_data_stream_arn

  depends_on              = [ module.kinesis ]
}

# deploy API Gateway
module "data_procesing" {
  source                     = "../modules/api-gateway"
  api_gateway_name           = var.api_gateway_name
  resource_name              = var.resource_name
  lambda_function_name       = module.lamda_function.lambda_function_arn
  lambda_function_invoke_arn = module.lamda_function.lambda_function_invoke_arn
  integration_http_method    = var.integration_http_method
  stage_name                 = var.stage_name

  depends_on                 = [ module.lamda_function ]
}