resource "aws_s3_bucket" "logging-bucket" {
  bucket = "${var.service_name}-sample2021-07-11-log-${var.environment}"
  tags = {
    Name    = "${var.service_name}-${var.region}-log-${var.environment}"
    Service = "${var.service_name}"
    Env     = "${var.environment}"
    Region  = var.region
  }
}