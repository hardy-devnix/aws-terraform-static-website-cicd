variable "region" {}
variable "root_domain" {}
variable "dns_record_ttl" {}
variable "subDomain" {}
variable "nc_api_uname" {}
variable "nc_api_key" {}
variable "website_bucket" {}
variable "force_destroy" {}
variable "versioning_enabled" {}
variable "index_document" {}
variable "route53_acm_depends_on" {
  # the value doesn't matter; we're just using this variable
  # to propagate dependencies.
  type    = any
  default = []
}