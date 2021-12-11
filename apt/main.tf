locals {
  apt_packages = [
    "cloc",
    "fonts-firacode",
    "xclip",
  ]
  cmd_print_version = jsonencode({
    # Including the : character in the output somehow messes up the map and it thinks it's always changing
    "\"version\"" = "\"$(apt-cache policy $PACKAGE | grep --color=never Installed | sed 's/Installed: //')\""
  })
}

# TODO There should be an apt-get update here perhaps, hopefully optimized to avoid running on every plan?

resource "shell_script" "apt_package" {
  for_each = toset(local.apt_packages)

  lifecycle_commands {
    # Sudo here will actually work normally during execution, if you have a pass you will be asked for it from STDIN
    create = format("sudo apt-get install -y --no-install-recommends $PACKAGE; echo %s", local.cmd_print_version)
    read   = format("echo %s", local.cmd_print_version)
    update = format("sudo apt-get install -y --no-install-recommends --reinstall $PACKAGE; echo %s", local.cmd_print_version)
    delete = "sudo apt-get remove -y $PACKAGE"
  }

  environment = {
    PACKAGE = each.value
  }
}
