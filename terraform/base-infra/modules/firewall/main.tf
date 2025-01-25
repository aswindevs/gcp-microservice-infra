# public - allow ingress from anywhere
resource "google_compute_firewall" "public_allow_all_inbound" {
  name = "${var.proj_prefix}-public-allow-ingress"

  network = var.network

  target_tags   = ["public"]
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  priority = "1000"

  allow {
    protocol = "all"
  }
}

# iap (Identity-Aware Proxy) - allow ingress from iap - https://cloud.google.com/iap/docs/using-tcp-forwarding
resource "google_compute_firewall" "iap_allow_network_inbound" {
  name = "${var.proj_prefix}-iap-allow-ingress"

  network = var.network

  target_tags = ["iap"]
  direction   = "INGRESS"
  priority = "1000"

  source_ranges = ["35.235.240.0/20"]

  allow {
    protocol = "tcp"
    ports    = ["121","22"]
  }
}





