# General Variables

variable "google_project" {
  type        = string
  description = "GCloud Project the resources will be created in"
}

variable "google_region" {
  type        = string
  description = "GCloud region the resources will be created in"
}

variable "google_zone" {
  type        = string
  description = "GCloud zone the resources will be created in"
}

variable "google_common_tags" {
  type        = object({
    owner = string
  })
  description = "GCloud common tags"
}

variable "google_dns_managed_zone_domain_name" {
  type        = string
  description = "GCloud managed DNS Zone Domain name"
}

variable "google_dns_record_set_cname_target" {
  type        = string
  description = "GCloud managed DNS Zone Record CNAME target, aka a domain name to point to"
}

variable "google_dns_record_set_txt_content" {
  type        = string
  description = "GCloud managed DNS Zone Record TXT content"
}
