terraform {
  cloud {
    organization = "orgforjenkinstests"

    workspaces {
      name = "newworkspace"
    }
  } 
}

resource "random_pet" "vpc" {}
