# If email, password and secret_key is not set through the arguments or env variables,
# then the env variable OP_SESSION_<subdomain> is checked for existence.

data "onepassword_vault" "this" {
  name = "Private"
}

data "onepassword_item_password" "github_token" {
  vault = data.onepassword_vault.this.id
  name  = "Github.com API Token"
}

data "onepassword_item_password" "gitlab_token" {
  vault = data.onepassword_vault.this.id
  name  = "Gitlab.com API Token"
}

data "external" "info" {
  program = ["bash", "${path.module}/tf_info.sh"]
}
