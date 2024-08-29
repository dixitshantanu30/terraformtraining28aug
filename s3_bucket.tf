# s3_buckets.tf

variable "bucket_names" {
  description = "List of S3 bucket names"
  type        = list(string)
  default     = ["shanbucket1", "shanbucket2"]  # Example values
}

resource "aws_s3_bucket" "appdev_buckets" {
  count = length(var.bucket_names)

  bucket = "appdev-${var.bucket_names[count.index]}"
  acl    = "private"

  tags = {
    Name = "appdev-${var.bucket_names[count.index]}"
  }
}
