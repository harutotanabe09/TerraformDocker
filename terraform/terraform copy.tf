# Create S3
# TerraformにStateファイルをS3に保存
terraform {
  backend "s3" {
    bucket = "app-20210627-tf-state-ap-northeast-1"
    key    = "terraform/terraform.tfstate"
    region = "ap-northeast-1"
  }
}