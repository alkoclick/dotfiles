provider "github" {
  token = data.onepassword_item_password.github_token.password
}
