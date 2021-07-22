/*
  
resource "google_service_account" "github_actions_sa" {
  account_id   = "github-actions-sa"
  display_name = "github actions service account"
}

resource "google_project_iam_member" "github_actions_sa_admin" {
  project = var.gcloud_project
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.github_actions_sa.email}"
}

resource "google_project_iam_member" "cloud_build_editor" {
  project = var.gcloud_project
  role    = "roles/cloudbuild.builds.editor"
  member  = "serviceAccount:${google_service_account.github_actions_sa.email}"
}

resource "google_project_iam_member" "cloud_build_service_account" {
  project = var.gcloud_project
  role    = "roles/cloudbuild.builds.builder"
  member  = "serviceAccount:${google_service_account.github_actions_sa.email}"
}

resource "google_project_iam_member" "service_account_user" {
  project = var.gcloud_project
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.github_actions_sa.email}"
}

resource "google_project_iam_member" "compute_storage_admin" {
  project = var.gcloud_project
  role    = "roles/compute.storageAdmin"
  member  = "serviceAccount:${google_service_account.github_actions_sa.email}"
}

resource "google_project_iam_member" "viewer" {
  project = var.gcloud_project
  role    = "roles/viewer"
  member  = "serviceAccount:${google_service_account.github_actions_sa.email}"
}

resource "google_project_iam_member" "composer_worker" {
  project = var.gcloud_project
  role    = "roles/composer.worker"
  member  = "serviceAccount:${google_service_account.github_actions_sa.email}"
}
*/

// Gives automatic cert
/*resource "google_cloud_run_domain_mapping" "domain_mapping" {
  location = "europe-west1"

  name = local.backend_hostname

  spec {
    route_name = google_cloud_run_service.run_service.name
  }

  metadata {
    namespace = var.gcloud_project
    annotations = {
      "run.googleapis.com/launch-stage" = "BETA"
    }
  }

  lifecycle {
    ignore_changes = [status, metadata]
  }
}*/
