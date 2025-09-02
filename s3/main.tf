
provider "google" {
  project = "training-2024-batch"
  region  = "us-central1"
  zone    = "us-central1-c"
}

data "google_client_config" "My_first_config" {
  provider = google
}

data "google_service_account_access_token" "My_first_test_service_account" {
  provider               = google
  target_service_account = "vijayasharma-terraform-sa@training-2024-batch.iam.gserviceaccount.com"
  scopes                 = ["https://www.googleapis.com/auth/cloud-platform"]
  lifetime               = "600s"
}

provider "google" {
  alias = "impersonated"

}

data "google_client_openid_userinfo" "me" {
  provider = google.impersonated
}

resource "google_storage_bucket" "static" {
 name          = "terraform-cloud-storage-bucket-12345"
 location      = "US"
 storage_class = "STANDARD"

 uniform_bucket_level_access = true
}
