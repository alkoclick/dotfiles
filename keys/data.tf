data "external" "info" {
  program = ["bash", "${path.module}/scripts/system_info.sh"]
}

data "external" "gpg_key_armored" {
  count = var.op_connect ? 1 : 0

  program = ["bash", "-c", format("echo %s", jsonencode({
    # The JSON output cannot contain newlines but Github wants them later, so we turn them to | instead
    "\"armored_key\"" : format("\"$(gpg --armor --export %s | tr '\r\n' '|')\"", local.gpg_key_id)
  }))]
}

data "onepassword_item_password" "gpg_passphrase" {
  count = var.op_connect ? 1 : 0

  vault = var.op_vault
  name  = "GPG Passphrase"
}
