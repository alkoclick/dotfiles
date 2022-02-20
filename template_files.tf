locals {
  template_files = [
    ".gitconfig",
  ]
  template_vars = {
    EMAIL    = var.email
    GPG_KEY  = module.keys.gpg_pub_key_id
    GPG_SIGN = var.op_connect
    NAME     = var.name
  }
}

resource "local_file" "template_file" {
  for_each = toset(local.template_files)
  content  = templatefile("${path.module}/template_files/${each.value}", local.template_vars)
  filename = pathexpand("~/${each.value}")
}
