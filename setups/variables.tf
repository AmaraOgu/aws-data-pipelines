# Define variables 
variable "region" {
  description = "The AWS region where this configuration will be deployed to"
  type        = string
}

# Define variables for s3 bucket creation
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

# Define variables for kinesis creation
variable "kinesis_stream_name" {
   description = "The name of the Kinesis data stream where the data will be sent to"
   type        = string
}

variable "kinesis_firehose_name" {
   description = "The name of the Kinesis Firehose where the data will be delivered to"
   type        = string
  
}

# Define variables for Lambda creation
variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "s3_key" {
  description = "Name of the S3 object or python file to run in lambda"
  type    = string
}

variable "handler" {
  description = "Name of the function to be executed. To be writen as s3_pyhon_script_key.handler"
  type        = string
}

variable "runtime" {
  description = "Runtime of the Lambda function"
  type        = string
}

variable "source_bucket" {
  description = "Name of the existing S3 bucket where the function code is located"
  type    = string
}

variable "timeout" {
  description = "Timeout of the Lambda function"
  type        = number
  default     = 60
}

variable "memory_size" {
  description = "Memory size of the Lambda function"
  type        = number
  default     = 128
}

# Define variables for  API Gateway Creation
variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "resource_name" {
  description = "Name of the API resource"
  type        = string
}

variable "integration_http_method" {
  description = "HTTP method to use for the integration"
  type        = string
  default     = "POST"
}

variable "stage_name" {
  description = "The Gateway deployment name"
  type        = string
}