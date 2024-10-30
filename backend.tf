terraform {
  backend "s3" {
    bucket = "dev-backend30"
    key    = "dev/end"
    region = "us-east-1"
  }
}
