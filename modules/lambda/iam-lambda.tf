resource "aws_iam_role_policy" "policy_lambda" {
  name = "policy_lambda"
  role = "${aws_iam_role.iam_role_lambda.id}"
policy = "${file("${path.module}/iam/lambda-policy.json")}"

}

resource "aws_iam_role" "iam_role_lambda" {
  name = "iam_role_lambda"
  assume_role_policy = "${file("${path.module}/iam/lambda-assume-policy.json")}"
}
