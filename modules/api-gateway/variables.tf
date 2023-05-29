# Define variables for the API gateway
variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "resource_name" {
  description = "Name of the API resource"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "integration_http_method" {
  description = "HTTP method to use for the integration"
  type        = string
  default     = "POST"
}

variable "lambda_function_invoke_arn" {
  description = "URI of the Lambda function"
  type        = string
}

variable "stage_name" {
  description = "The Gateway deployment name"
  type        = string
}