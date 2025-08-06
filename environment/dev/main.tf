terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# S3 bucket for build artifacts
module "s3" {
  source = "../../modules/s3"

  environment       = var.environment
  bucket_name      = var.artifacts_bucket_name
  enable_versioning = true
  lifecycle_days   = 30
}

# DynamoDB table for application data
module "dynamodb" {
  source = "../../modules/dynamodb"

  environment   = var.environment
  table_name    = var.dynamodb_table_name
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "id"

  attributes = [
    {
      name = "id"
      type = "S"
    }
  ]

  point_in_time_recovery = false
}

# EC2 Jenkins server
module "ec2" {
  source = "../../modules/ec2"

  environment          = var.environment
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_name            = var.key_name
  allowed_ssh_cidr    = var.allowed_ssh_cidr
  allowed_jenkins_cidr = var.allowed_jenkins_cidr
  root_volume_size    = 30
  artifacts_bucket_arn = module.s3.bucket_arn
}