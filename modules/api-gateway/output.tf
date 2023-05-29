# Output the API Gateway endpoint URL
output "api_gateway_url" {
  value = aws_api_gateway_deployment.deployment.invoke_url
}

# Output the API Gateway ARN
output "api_gateway_arn" {
  value = aws_api_gateway_rest_api.api_gateway.execution_arn
}