provider "aws" {
  region = "us-east-1"
}

module "s3" {
   source = "./modules/s3" 
   bucket_name = var.bucket_name
   s3_bucket_domain_name = var.s3_bucket_domain_name
   aws_s3_bucket_arn = var.aws_s3_bucket_arn
   bucket_id = var.bucket_id
}


module "cf" {
  source = "./modules/cf"
  s3_bucket_domain_name = module.s3.s3_bucket_domain_name
  bucket_id = module.s3.bucket_id
  aws_s3_bucket_arn = module.s3.aws_s3_bucket_arn

}
