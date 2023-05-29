# Define variables for kinesis creation
variable "kinesis_stream_name" {
   description = "The name of the Kinesis data stream where the data will be sent to"
   type        = string
}

variable "kinesis_firehose_name" {
   description = "The name of the Kinesis Firehose where the data will be delivered to"
   type        = string
  
}

# variable "firehose_destination" {
#   description = "The prefered destination to store the data"
#   type        = string
# }

variable "bucket_arn" {
   description = "The ARN of the S3 bucket where the Kinesis Firehose will write data to"
   type        = string
}