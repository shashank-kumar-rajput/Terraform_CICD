terraform {
  backend "s3" {
    bucket = "tf-aws-state-bucket"
    key = "main"
    region = "us-east-1"
    profile = "default"

    dynamodb_table = "tf-dynamo-db-table"
  }
}