resource "aws_lambda_function" "lambda" {
  filename      = var.file_location
  function_name = var.function_name 
  role          = "${aws_iam_role.iam_role_lambda.arn}"
  handler       = var.handler
  timeout       = var.timeout

  source_code_hash = "${filebase64sha256(var.file_location)}"

  runtime = var.runtime
  dynamic "environment" {
    for_each = length(keys(var.environment_variables)) == 0 ? [] : [true]
    content {
      variables = var.environment_variables
    }
  }
}
