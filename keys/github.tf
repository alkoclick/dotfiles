resource "github_user_ssh_key" "public_key" {
  count = var.op_connect ? 1 : 0

  key   = tls_private_key.this.public_key_openssh
  title = format("%s@%s", data.external.info.result.user, data.external.info.result.host)
}
