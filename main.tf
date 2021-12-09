locals {
  copy_files = [
    ".bashrc",
    ".bash_aliases",
    ".fzf.bash",
    ".config/micro/bindings.json",
    ".config/micro/settings.json",
    ".config/starship.toml",
  ]
  template_files = [
    ".gitconfig",
  ]
  template_vars = {
    EMAIL   = var.email
    GPG_KEY = var.gpg_key
    NAME    = var.name
  }
}

resource "local_file" "copy_file" {
  for_each = toset(local.copy_files)
  content  = file("${path.module}/copy_files/${each.value}")
  filename = pathexpand("~/${each.value}")
}

resource "local_file" "template_file" {
  for_each = toset(local.template_files)
  content  = templatefile("${path.module}/template_files/${each.value}", local.template_vars)
  filename = pathexpand("~/${each.value}")
}

module "keys" {
  source = "./keys"

  email = var.email
  name  = var.name
}
