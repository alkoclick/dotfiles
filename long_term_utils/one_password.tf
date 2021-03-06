locals {
  op_version     = "v1.12.3"
  cmd_op_version = format("echo %s", jsonencode({ "\"version\"" = "\"$(op --version)\"" }))
}

resource "shell_script" "install_op" {
  lifecycle_commands {
    create = format("%s\n%s", file("${path.root}/scripts/install_op.sh"), local.cmd_op_version)
    read   = local.cmd_op_version
    update = format("%s\n%s", file("${path.root}/scripts/install_op.sh"), local.cmd_op_version)
    delete = "sudo rm /usr/local/bin/op || true"
  }

  environment = {
    VERSION = local.op_version
  }
}
