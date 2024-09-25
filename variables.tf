
variable "project_id" {
  description = "GCP Project ID"
  default = "tf-pdh"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "Name of the VPC Network"
  type        = string
  default     = "gcp-vpc-network"
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
  default     = [
    "10.64.0.0/19", 
    "10.64.32.0/19",  
    "10.10.0.0/24",
    "10.10.1.0/25",
    "10.10.1.128/25"
  ]
}

variable "subnet_names" {
  description = "List of names for the subnets"
  type        = list(string)
  default     = [
    "gcp-subnet-1",
    "gcp-subnet-2",
    "gcp-subnet-3",
    "gcp-subnet-4",
    "gcp-subnet-5"
  ]
}

variable "firewall_name" {
  description = "Name of the Firewall Rule"
  type        = string
  default     = "gcp-firewall-rule"
}

variable "allowed_ip_range" {
  description = "Allowed IP Range for Firewall Rules"
  type        = string
  default     = "0.0.0.0/0"
}
