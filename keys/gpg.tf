locals {
  cmd_print_key = jsonencode({
    "\"pub\"" : "\"$(gpg --list-signatures --with-colons $ID | grep pub | cut -d : -f 5)\""
  })
  gpg_key_id = try(shell_script.gpg_key[0].output.pub, "")
}

resource "shell_script" "gpg_key" {
  count = var.op_connect ? 1 : 0

  lifecycle_commands {
    create = file("${path.module}/scripts/create_gpg_key.sh")
    read   = format("echo %s", local.cmd_print_key)
    delete = file("${path.module}/scripts/delete_gpg_key.sh")
  }

  environment = {
    EMAIL = var.email
    ID    = random_string.random.id
    NAME  = var.name
  }

  sensitive_environment = {
    PASSPHRASE = data.onepassword_item_password.gpg_passphrase[0].password
  }
}

# We use this random "id" to separate keys generated and maintained by TF from any others in the local keyring
resource "random_string" "random" {
  length  = 8
  special = false
}
