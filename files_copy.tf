locals {
  files = [
    ".bashrc",
    ".bash_aliases",
    ".fzf.bash",
    ".gitconfig",
    ".config/micro/bindings.json",
    ".config/micro/settings.json",
    ".config/starship.toml",
  ]
}

resource "local_file" "copy_file" {
  for_each = toset(local.files)
  content  = file("${path.module}/copy_files/${each.value}")
  filename = pathexpand("~/${each.value}")
}
