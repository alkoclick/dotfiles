locals {
  gsettings = {
    # Alt-tab only on current workspace
    wo_only = {
      path  = "org.gnome.shell.app-switcher"
      key   = "current-workspace-only"
      value = "true"
    }
    # Alt-tab across windows
    windows = {
      path  = "org.gnome.desktop.wm.keybindings"
      key   = "switch-windows"
      value = "\"['<Alt>Tab']\""
    }
    # Needs disabling otherwise switching applications still gets triggered over windows
    apps = {
      path  = "org.gnome.desktop.wm.keybindings"
      key   = "switch-applications"
      value = "[]"
    }
    # Move windows across workspaces in secondary screens
    wo_sec = {
      path  = "org.gnome.mutter"
      key   = "workspaces-only-on-primary"
      value = "false"
    }
    # Autohide the side dock
    dock1 = {
      path  = "org.gnome.shell.extensions.dash-to-dock"
      key   = "dock-fixed"
      value = "false"
    }
    dock2 = {
      path  = "org.gnome.shell.extensions.dash-to-dock"
      key   = "autohide"
      value = "true"
    }
  }
  cmd_print_version = jsonencode({
    "\"version\"" = "\"$(gsettings get $GS_PATH $GS_KEY)\""
  })
}

resource "shell_script" "gsettings" {
  for_each = local.gsettings

  lifecycle_commands {
    create = format("gsettings set $GS_PATH $GS_KEY $GS_VAL; echo %s", local.cmd_print_version)
    read   = format("echo %s", local.cmd_print_version)
    update = format("gsettings set $GS_PATH $GS_KEY $GS_VAL; echo %s", local.cmd_print_version)
    delete = "gsettings reset $GS_PATH $GS_KEY"
  }

  environment = {
    GS_PATH = each.value.path
    GS_KEY  = each.value.key
    GS_VAL  = each.value.value
  }
}
