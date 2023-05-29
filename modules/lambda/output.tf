# Output the lamnda function arn
output "lambda_function_arn" {
  value = aws_lambda_function.lambda_function.arn
}

output "lambda_function_invoke_arn" {
  value = aws_lambda_function.lambda_function.invoke_arn
}