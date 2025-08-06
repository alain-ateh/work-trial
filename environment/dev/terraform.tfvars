aws_region    = "us-east-2"
environment   = "dev"
ami_id        = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2
instance_type = "t3.medium"
key_name      = "your-dev-key-pair"

artifacts_bucket_name  = "jenkins-build-artifacts"
dynamodb_table_name   = "application-data"

allowed_ssh_cidr     = ["0.0.0.0/0"]
allowed_jenkins_cidr = ["0.0.0.0/0"]