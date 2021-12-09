terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    onepassword = {
      source  = "anasinnyk/onepassword"
      version = "1.2.1"
    }
    shell = {
      source  = "scottwinkler/shell"
      version = "~> 1.7"
    }
  }
  required_version = ">= 1.0.0"
}
