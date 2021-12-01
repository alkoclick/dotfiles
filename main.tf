resource "tls_private_key" "this" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

resource "local_file" "private_key" {
  content         = tls_private_key.this.private_key_pem
  filename        = pathexpand("~/.ssh/id_ecdsa")
  file_permission = "600"
}

resource "local_file" "public_key" {
  content         = tls_private_key.this.public_key_openssh
  filename        = pathexpand("~/.ssh/id_ecdsa.pub")
  file_permission = "644"
}

resource "github_user_ssh_key" "public_key" {
  key   = tls_private_key.this.public_key_openssh
  title = format("%s@%s", data.external.info.result.user, data.external.info.result.host)
}

output "public_key" {
  value = tls_private_key.this.public_key_openssh
}
