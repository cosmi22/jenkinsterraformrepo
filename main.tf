terraform {
  cloud {
    organization = "terraform-cloud-org-testing"

    workspaces {
      name = "newworkspace"
    }
  }
}

resource "random_pet" "vpc" {}
