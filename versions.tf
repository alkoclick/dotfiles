terraform {
  required_providers {
    onepassword = {
      source  = "anasinnyk/onepassword"
      version = "1.2.1"
    }
    github = {
      source  = "integrations/github"
      version = "4.18.0"
    }
  }
  required_version = ">= 1.0.0"
}
