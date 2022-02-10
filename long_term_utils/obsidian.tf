locals {
  obsidian_version = "0.13.23"
}

resource "shell_script" "obsidian" {
  lifecycle_commands {
    create = file("${path.root}/scripts/install_obsidian.sh")
    delete = "sudo rm $(which obsidian)"
  }

  environment = {
    VERSION = local.obsidian_version
  }
}
