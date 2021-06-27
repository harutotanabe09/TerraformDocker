provider "aws" {
  region = "ap-northeast-1"
}

variable "service_name" {
  default = "sample-app"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "environment" {
  default = "develop"
}

