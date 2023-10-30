terraform {
  cloud {
    organization = "orgforjenkinstests"

    workspaces {
      name = "common"
    }
  }
}

resource "random_pet" "vpc" {}
