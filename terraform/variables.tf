variable "region" {}
variable "root_domain" {}
variable "dns_record_ttl" {}
variable "subDomain" {}
variable "route53_acm_depends_on" {
  # the value doesn't matter; we're just using this variable
  # to propagate dependencies.
  type    = any
  default = []
}