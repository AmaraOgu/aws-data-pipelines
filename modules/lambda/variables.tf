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
  description = "Name of the S3 bucket where the function code is located"
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

variable "kinesis_data_stream_arn" {
  description = "The arn of the kinesis data stream"
}
