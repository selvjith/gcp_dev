provider "google" {
 alias = "impersonation"
 scopes = [
   "https://www.googleapis.com/auth/cloud-platform",
   "https://www.googleapis.com/auth/userinfo.email",
 ]
}

data "google_service_account_access_token" "default" {
 provider               	= google.impersonation
 target_service_account 	= local.terraform_service_account
 scopes                 	= ["userinfo-email", "cloud-platform"]
 lifetime               	= "1200s"
}

provider "google" {
 project 		= "qwiklabs-gcp-01-d068ec587483"
 access_token	= data.google_service_account_access_token.default.access_token
 request_timeout 	= "60s"
}

locals {
 terraform_service_account = "terraform@qwiklabs-gcp-01-d068ec587483.iam.gserviceaccount.com"
}