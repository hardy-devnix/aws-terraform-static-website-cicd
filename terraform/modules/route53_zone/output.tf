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
  value =  try(aws_route53_zone.mainDomain.name_servers, [])
  }