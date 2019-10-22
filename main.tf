provider "aws" {
  profile = "${var.profile}"
  region  = "${var.region}"
}

module "pcm_post_lambda" {
  source = "./pcm_lambda"
}

