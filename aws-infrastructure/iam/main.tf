resource "aws_iam_role_policy" "lambda_execution_policy" {
  name = "lambda_exection_policy"
  role = "${aws_iam_role.lambda_execution_role.id}"

  policy = "${file("${path.module}/lambda-policy.json")}"
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = "${file("${path.module}/lambda-assume-policy.json")}"
}

output "arn" {
  value = "${aws_iam_role.lambda_execution_role.arn}"
}
