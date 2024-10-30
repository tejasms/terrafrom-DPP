output "s3_bucket_domain_name" {
  value       = aws_s3_bucket.s3publicblock44.bucket_regional_domain_name
  description = "The regional domain name of the S3 bucket"
}

output "aws_s3_bucket_arn" {
    value = aws_s3_bucket.s3publicblock44.arn
  
}
output "bucket_id" {
  value       = aws_s3_bucket.s3publicblock44.id
  description = "The ID of the S3 bucket"
}

