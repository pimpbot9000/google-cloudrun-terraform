variable path {default = "/home/pimpbot9000/udemy-terraform" }

provider "google" {
    project = var.project_id
    region  = "europe-west3"
    zone    = "europe-west3-a"
    credentials = "${file("${var.path}/credentials.json")}"
}

# export GOOGLE_APPLICATION_CREDENTIALS=/home/pimpbot9000/udemy-terraform/secrets.json