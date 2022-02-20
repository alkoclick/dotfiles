locals {
  copy_files = [
    ".bashrc",
    ".bash_aliases",
    ".fzf.bash",
    ".config/git/ignore",
    ".config/micro/bindings.json",
    ".config/micro/settings.json",
    ".config/starship.toml",
    ".local/share/applications/obsidian.desktop",
  ]
  copy_files_nontext = [
    # This folder is checked by default on the desktop file icon standard: https://specifications.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html
    ".icons/obsidian.png",
  ]
}

resource "local_file" "copy_file" {
  for_each = toset(local.copy_files)
  content  = file("${path.module}/copy_files/${each.value}")
  filename = pathexpand("~/${each.value}")
}

resource "local_file" "copy_file_nontext" {
  for_each = toset(local.copy_files_nontext)
  content_base64  = filebase64("${path.module}/copy_files/${each.value}")
  filename = pathexpand("~/${each.value}")
}
