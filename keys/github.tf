resource "github_user_ssh_key" "public_key" {
  key   = tls_private_key.this.public_key_openssh
  title = format("%s@%s", data.external.info.result.user, data.external.info.result.host)
}
