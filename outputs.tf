
output "vpc_network_name" {
  description = "The name of the created VPC Network"
  value       = google_compute_network.vpc_network.name
}

output "subnet_names" {
  description = "The names of all created subnets in the VPC Network"
  value       = [for subnet in google_compute_subnetwork.subnet : subnet.name]
}

output "subnet_ids" {
  description = "The IDs of all created subnets in the VPC Network"
  value       = [for subnet in google_compute_subnetwork.subnet : subnet.id]
}

output "firewall_rule_name" {
  description = "The name of the firewall rule created"
  value       = google_compute_firewall.firewall_rules.name
}
