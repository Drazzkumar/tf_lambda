
# If archive file is changed, updates zip to S3 repository
resource "aws_s3_bucket_object" "tf_testr_pcm_bucket" {
  bucket = "tf-testr-pcm-bucket"
  key    = "lambda/layers/vendor_layer.zip"
  source = "${data.archive_file.pcm_vendor_layer.output_path}"
  depends_on = [
  "data.archive_file.pcm_vendor_layer"]
}

data "archive_file" "pcm_vendor_layer" {
  type        = "zip"
  source_dir  = "vendors/"
  output_path = "zip_files/vendor_layer.zip"
}

resource "aws_lambda_layer_version" "tf_pcm_vendor_layer" {
  layer_name          = "tf_pcm_vendor_layer"
  s3_bucket           = "${aws_s3_bucket_object.tf_testr_pcm_bucket.bucket}"
  s3_key              = "${aws_s3_bucket_object.tf_testr_pcm_bucket.key}"
  s3_object_version   = "${aws_s3_bucket_object.tf_testr_pcm_bucket.version_id}"
  description         = "Pcm base layer"
  compatible_runtimes = ["python3.6", "python3.7"]
}

output "arn" {
  value = "${aws_lambda_layer_version.tf_pcm_vendor_layer.arn}"
}
