terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      version = ">= 2.13.0"
    }
    random = {
      version = ">= 2.1.2"
    }
  }

  cloud {
    organization = "Certquart"
    workspaces {
      name = "conro-test-1"
    }
  }

}


provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}




