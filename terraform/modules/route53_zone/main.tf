resource "aws_route53_zone" "mainDomain" {
  name = var.root_domain
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