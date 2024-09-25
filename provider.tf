
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.0.0"
    }
  }
}

provider "google" {
  credentials = file("/Users/lee.unks/terraform-key.json")
  project     = "tf-pdh"
  region      = "us-central1"  # or any other region you prefer
}