resource "aws_route53_zone" "mainDomain" {
  name = var.root_domain
}

resource "aws_route53_zone" "subDomain" {
  name = var.subdomain

}

resource "aws_route53_record" "dev-ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.subdomain
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.subDomain.name_servers
}