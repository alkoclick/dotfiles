locals {
  profiles_key = "/org/gnome/terminal/legacy/profiles:"
  uuid         = "631091e7-8abd-4dcd-a8e9-14e9b720416c"

  terminal_id = format("%s/:%s", local.profiles_key, local.uuid)

  dconf = {
    format("%s/list", local.profiles_key) = format("['%s']", local.uuid)
    format("%s/visible-name", local.terminal_id)   = "'DarkTerminal'"

    # Colors
    format("%s/background-color", local.terminal_id)      = "'rgb(23,20,33)'"
    format("%s/foreground-color", local.terminal_id)      = "'rgb(208,207,204)'"
    format("%s/bold-color-same-as-fg", local.terminal_id) = "true"
    format("%s/use-theme-colors", local.terminal_id)      = "false"
    format("%s/highlight-colors-set", local.terminal_id)  = "false"
    format("%s/cursor-colors-set", local.terminal_id)     = "false"

    # Transparency
    format("%s/use-theme-transparency", local.terminal_id)          = "false"
    format("%s/use-transparent-background", local.terminal_id)      = "true"
    format("%s/background-transparency-percent", local.terminal_id) = "10"

    # Fonts
    format("%s/font", local.terminal_id)            = "'Ubuntu Mono 15'"
    format("%s/use-system-font", local.terminal_id) = "false"

    # Shortcuts
    "/org/gnome/terminal/legacy/keybindings/close-tab" = "'<Primary>w'"
    "/org/gnome/terminal/legacy/keybindings/prev-tab"  = "'<Alt>Left'"
    "/org/gnome/terminal/legacy/keybindings/next-tab"  = "'<Alt>Right'"
  }
  dconf_print_version = jsonencode({
    "\"version\"" = "\"$(dconf read $KEY)\""
  })
}

resource "shell_script" "dconf" {
  for_each = local.dconf

  lifecycle_commands {
    create = format("dconf write $KEY $VALUE; echo %s", local.dconf_print_version)
    read   = format("echo %s", local.dconf_print_version)
    update = format("dconf write $KEY $VALUE; echo %s", local.dconf_print_version)
    delete = "dconf reset $KEY"
  }

  environment = {
    KEY = each.key
    VALUE = each.value
  }
}
