terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  required_version = ">= 0.13"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = var.google_project
  region  = var.google_region
  zone    = var.google_zone
}
