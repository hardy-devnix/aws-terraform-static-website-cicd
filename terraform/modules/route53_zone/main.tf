terraform {
  required_providers {
    namecheap = {
      source  = "namecheap/namecheap"
      version = ">= 2.0.0"
    }
  }
}

resource "aws_route53_zone" "mainDomain" {
  name = var.root_domain
}

resource "namecheap_domain_records" "prod" {
  domain = var.root_domain
  mode   = "OVERWRITE"

  nameservers = [
    aws_route53_zone.mainDomain.name_servers[0],
    aws_route53_zone.mainDomain.name_servers[1],
    aws_route53_zone.mainDomain.name_servers[2],
    aws_route53_zone.mainDomain.name_servers[3],
  ]
}

resource "aws_route53_zone" "subDomain" {
  name = var.subDomain

}

resource "aws_route53_record" "dev-ns" {
  zone_id = aws_route53_zone.mainDomain.zone_id
  name    = var.subDomain
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.subDomain.name_servers
}

