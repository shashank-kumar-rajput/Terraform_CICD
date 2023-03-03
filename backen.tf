terraform {
  backend "s3" {
    bucket = "tf-aws-state-bucket1"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "tf-dynamo-db-table"
  }
}