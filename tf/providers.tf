terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  required_version = ">= 0.13"
}

provider "google" {
  project = var.google_project
  region  = var.google_region
  zone    = var.google_zone
}
