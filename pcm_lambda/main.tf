locals {
  lambda_zip_location = "zip_files/pcm_post_lambda.zip"
}

data "archive_file" "pcm_post_lambda" {
  type        = "zip"
  source_file = "${path.module}/pcm_post.py"
  output_path = "${local.lambda_zip_location}"
}


module "iam_for_lambda" {
  source = "../aws-infrastructure/iam"
}

module "pcm_base_layer" {
  source = "../aws-infrastructure/layers"
  
}
resource "aws_lambda_function" "pcm_post_lamda" {
  filename      = "${local.lambda_zip_location}"
  function_name = "TF_TESTR_PCM_POST_LAMBDA"
  role          = "${module.iam_for_lambda.arn}"
  handler       = "pcm_post.handler"
  layers =["${module.pcm_base_layer.arn}"]
  # Helps to update code

  source_code_hash = "${filebase64sha256(local.lambda_zip_location)}"
  runtime          = "python3.7"
}
