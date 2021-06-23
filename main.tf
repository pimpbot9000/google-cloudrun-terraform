#   Service account
#   * Owner
#   * Project IAM Admin
#

/*resource "google_compute_instance" "vm_instance" {
  name = "my-first-vm"
  machine_type = "f1-micro"
  zone = "europe-west2-a"

  boot_disk {
      initialize_params{
          image = "ubuntu-os-cloud/ubuntu-1604-lts"
      }
  }

  network_interface {
      network = "default"
  }

  service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}*/

/*resource "google_project_service" "cloud_resource_manager_api" {
  service = "cloudresourcemanager.googleapis"
}*/

# Required by cloud run service
resource "google_project_service" "run_api" {
  service = "run.googleapis.com"

  disable_on_destroy = true
}

resource "google_project_service" "cloubuild_api" {
  service="cloudbuild.googleapis.com"
}

resource "google_cloud_run_service" "run_service" {
  name = "app"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "eu.gcr.io/${var.project_id}/helloworld:latest"        
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  # Waits for the Cloud Run API to be enabled
  depends_on = [google_project_service.run_api]
}

resource "google_container_registry" "registry" {
  project  = var.project_id
  location = "EU"
}

# Allow unauthenticated users to invoke the service
# Be sure to enable setting iam policies for service account!!!!
resource "google_cloud_run_service_iam_member" "run_all_users" {
  service  = google_cloud_run_service.run_service.name
  location = google_cloud_run_service.run_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_dns_managed_zone" "parent-zone" {
  provider = "google-beta"
  name        = "my-zone"
  dns_name    = "my-zone.hashicorptest.com."
  description = "Test Description"
}

resource "google_dns_record_set" "resource-recordset" {
  provider = "google-beta"
  managed_zone = google_dns_managed_zone.parent-zone.name
  name         = "test-record.my-zone.hashicorptest.com."
  type         = "CNAME"
  rrdatas      = [app-rprum7hb3a-uc.a.run.app]
  ttl          = 86400
}

output "service_url" {
  value = google_cloud_run_service.run_service.status[0].ip_address
}