variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "ami_id" {
  description = "AMI ID for Jenkins server"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
}

variable "artifacts_bucket_name" {
  description = "S3 bucket name for build artifacts"
  type        = string
  default     = "jenkins-build-artifacts"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = "application-data"
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_jenkins_cidr" {
  description = "CIDR blocks allowed for Jenkins access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
