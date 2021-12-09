data "external" "info" {
  program = ["bash", "${path.module}/system_info.sh"]
}
