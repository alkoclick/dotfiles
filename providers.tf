provider "github" {
  token = try(data.onepassword_item_password.github_token[0].password, "")
}

provider "shell" {
  interpreter = ["/bin/bash", "-c"]
}
