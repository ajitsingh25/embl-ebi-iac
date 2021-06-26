# Configure the Google Cloud provider

provider "google" {
  credentials = "${file("${var.credentials}")}"
  project = "${var.gcp_project}"
  region  = "${var.region}"
}

# Create a Google Compute instance
resource "google_compute_instance" "example" {
  name          = "example"
  machine_type  = "${var.machine}"
  zone          = "${var.zone}"
  
  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20210609"
    }
  }
  
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  
  tags = ["http"]

  metadata_startup_script = "apt update  ; apt install -y curl git ; curl -fsSL https://get.docker.com -o get-docker.sh ; sh get-docker.sh ; curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose ; chmod +x /usr/local/bin/docker-compose; cd /var/tmp ; git clone https://github.com/ajitsingh25/embi-ebi.git ; cd /var/tmp/embi-ebi ; sh build.sh"

}

# Create FW Rule to allow port 80 and 3306
resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80","3306"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http"]
}


# Output Apache public IP
output "public_ip" {
  value = "${google_compute_instance.example.network_interface.0.access_config.0.nat_ip}"
}
