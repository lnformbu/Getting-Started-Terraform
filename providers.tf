terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.49.0"
    }
    random = {
      version = ">= 2.1.2"
    }
  }

  cloud {
    # organization = "Certquart"
    # workspaces {
    #   name = "conro-test-1"
    # }
  }
}



#=================================================

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      hashicorp-learn = "module-use"
    }
  }
}


