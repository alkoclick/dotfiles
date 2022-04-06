locals {
  brew_packages = [
    "aws-vault",
    "fzf",
    "gitleaks",
    "httpie",
    "kubectl",
    "kubectx",
    "lazygit",
    "micro",
    "starship",
    "terraform-docs",
    "zoxide",
  ]
  cmd_print_version = jsonencode({ "\"version\"" = "\"$(brew list --versions $PACKAGE)\"" })
}

resource "shell_script" "brew_package" {
  for_each = toset(local.brew_packages)

  lifecycle_commands {
    create = format("brew install -q $PACKAGE; echo %s", local.cmd_print_version)
    read   = format("echo %s", local.cmd_print_version)
    update = format("brew install -q $PACKAGE; echo %s", local.cmd_print_version)
    delete = "brew uninstall -q $PACKAGE"
  }

  environment = {
    HOMEBREW_NO_INSTALL_UPGRADE            = 1
    HOMEBREW_NO_ENV_HINTS                  = 1
    HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK = 1
    PACKAGE                                = each.value
  }
}
