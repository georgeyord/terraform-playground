# https://www.terraform.io/docs/configuration/outputs.html
output "google_dns_managed_zone_visibility" {
  value = google_dns_managed_zone.yord-tf-dns.visibility
}
