locals {
  apt_packages = [
    "fonts-firacode",
    "xclip",
  ]
}

# TODO There should be an apt-get update here perhaps, hopefully optimized to avoid running on every plan?

resource "shell_script" "apt_package" {
  for_each = toset(local.apt_packages)

  lifecycle_commands {
    create = "sudo apt-get install -y $PACKAGE"
    delete = "sudo apt-get remove -y $PACKAGE"
  }

  environment = {
    PACKAGE = each.value
  }
}
