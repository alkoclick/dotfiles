resource "shell_script" "jetbrains_toolbox" {
  lifecycle_commands {
    create = file("${path.root}/scripts/install_jetbrains_toolbox.sh")
    delete = <<EOF
      rm $(which /usr/local/bin/jetbrains-toolbox)
      rm -rf $INSTALL_DIR
    EOF
  }

  environment = {
    INSTALL_DIR = "/opt/jetbrains-toolbox"
  }
}
