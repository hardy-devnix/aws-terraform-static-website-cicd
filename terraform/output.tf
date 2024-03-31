output "s3_bucket_id" {
  description = "The ID of the S3 Bucket"
  value       = module.s3_website.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 Bucket"
  value       = module.s3_website.s3_bucket_arn
}

output "website_url" {
  description = "The URL of the Website"
  value       = module.s3_website.website_url
}

output "root_domain" {
  description = "The root domain name for the website"
  value       = var.root_domain
}

output "sub_domain" {
  description = "The root domain name for the website"
  value       = var.subDomain
}

output "Root-Name-Servers" {
  description = "The root domain AWS name servers"
  value       = try(module.dns_zone.aws_route53_zone.mainDomain.name_servers, [])
}

output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  #value       = module.cloudfront.aws_cloudfront_distribution.website_distribution.id
  value = try(module.cloudfront.aws_cloudfront_distribution.this[0].id, "")
}
