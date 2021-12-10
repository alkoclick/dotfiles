module "apt" {
  source = "./apt"
}

module "brew" {
  source = "./brew"
}

module "keys" {
  source = "./keys"

  email      = var.email
  op_connect = var.op_connect
  name       = var.name
}
