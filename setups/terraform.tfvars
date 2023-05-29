# Providers block
region  = "us-east-1"

# Creates an S3 bucket for storing raw data
bucket_name = "product-data"

# Createing Amazon Kinesis data stream to send data from Lambda to S3
kinesis_stream_name    = "demo-datastream"
kinesis_firehose_name  = "demo_firehouse"
# firehose_destination   = "extended_s3"
# bucket_arn             = module.data-s3-bucket.bucket_arn


# Deploying an lambda function that sends data to the Kinesis stream
function_name           = "run_data_processing"
s3_key                  = "process_data.zip"
handler                 = "process_data.lambda_handler"
runtime                 = "python3.8"
timeout                 = 60
memory_size             = 128
source_bucket           = "helper-bucket123" 
# kinesis_data_stream_arn = module.kinesis.kinesis_data_stream_arn


# Deploying API Gateway
api_gateway_name           = "data-processing"
resource_name              = "product"
# lambda_function_name       = module.lamda_function.lambda_function_arn
# lambda_function_invoke_arn = module.lamda_function.lambda_function_invoke_arn
integration_http_method    = "POST"
stage_name                 = "dev"
