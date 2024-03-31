output "s3_bucket_id" {
    description = "The ID of the S3 bucket"
    value = aws_s3_bucket.website_bucket.id
} 

output "s3_bucket_arn" {
    description = "The ARN of the S3 bucket"
    value = aws_s3_bucket.website_bucket.arn
} 

output "website_url" {
    description = "The URL of the website"
    value = "https://${aws_s3_bucket.website_bucket.bucket}.s3-website-${var.region}.amazonaws.com"
} 

output "index_document" {
    description = "The index document of the s3 website"
    value =  var.index_document
    }

output "bucket_regional_domain_name" {
    description = "The regional domanin name of the s3 bucket"
    value = aws_s3_bucket.website_bucket.bucket_regional_domain_name
  
}