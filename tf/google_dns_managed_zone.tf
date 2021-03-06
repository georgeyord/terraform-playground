# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone
resource "google_dns_managed_zone" "yord-tf-dns" {
  name        = "yord-domain"
  dns_name    = var.google_dns_managed_zone_domain_name
  description = "Yord's DNS zone"

  labels = var.google_common_tags
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set
resource "google_dns_record_set" "yord-tf-dns-recordset-txt" {
  name         = google_dns_managed_zone.yord-tf-dns.dns_name
  managed_zone = google_dns_managed_zone.yord-tf-dns.name
  type         = "TXT"
  ttl          = 300
  rrdatas      = [
    var.google_dns_record_set_txt_content
  ]
}

resource "google_dns_record_set" "yord-tf-dns-recordset-cname" {
  name         = "cname.${google_dns_managed_zone.yord-tf-dns.dns_name}"
  managed_zone = google_dns_managed_zone.yord-tf-dns.name
  type         = "CNAME"
  ttl          = 300
  rrdatas      = [
    var.google_dns_record_set_cname_target
  ]
}
resource "google_dns_record_set" "mx" {
  name         = google_dns_managed_zone.yord-tf-dns.dns_name
  managed_zone = google_dns_managed_zone.yord-tf-dns.name
  type         = "MX"
  ttl          = 3600

  rrdatas = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com.",
  ]
}
