terraform {
  backend "s3" {
    bucket = "prod-backend30"
    key    = "dev/end"
    region = "us-east-1"
  }
}
