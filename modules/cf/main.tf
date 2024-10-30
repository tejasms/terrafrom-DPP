resource "aws_cloudfront_distribution" "s3_distribution444" {
   origin {
    domain_name              = var.s3_bucket_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_distribution444.id
    origin_id                = var.bucket_id
   }

 
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Some comment"
  default_root_object = "index.html"


  default_cache_behavior {
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.bucket_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }  

 
   restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

   viewer_certificate {
    cloudfront_default_certificate = true 
  }
}


resource "aws_cloudfront_origin_access_control" "s3_distribution444" {
  name                              = "pre-prodoac2"
  description                       = "Example Policy"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3_distribution444.domain_name
}

data "aws_iam_policy_document" "s3publicblock44" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${var.aws_s3_bucket_arn}/*"]
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = [aws_cloudfront_distribution.s3_distribution444.arn]
    }
  }
}

resource "aws_s3_bucket_policy" "s3publicblock_policy" {
  bucket = var.bucket_id
  policy = data.aws_iam_policy_document.s3publicblock44.json
}
