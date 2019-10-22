provider "aws" {
  profile = "pcm"
  region  = "ap-south-1"
}

module "pcm_post_lambda" {
  source = "./pcm_lambda"
}

