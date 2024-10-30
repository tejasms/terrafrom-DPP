terraform {
  backend "s3" {
    bucket = "preprod-backend44"
    key    = "dev/end"
    region = "us-east-1"
  }
}
