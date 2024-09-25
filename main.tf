
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  count                   = length(var.subnet_cidrs)
  name                    = var.subnet_names[count.index]
  ip_cidr_range           = var.subnet_cidrs[count.index]
  network                 = google_compute_network.vpc_network.id
  region                  = var.region
}

resource "google_compute_firewall" "firewall_rules" {
  name    = var.firewall_name
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = [var.allowed_ip_range]
}
