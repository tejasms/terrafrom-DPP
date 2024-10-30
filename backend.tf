terraform {
  backend "s3" {
    bucket = "dev-backend44"
    key    = "dev/end"
    region = "us-east-1"
  }
}
