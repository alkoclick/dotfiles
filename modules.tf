module "apt" {
  source = "./apt"
}

module "brew" {
  source = "./brew"
}

module "dconf" {
  count = var.long_term ? 1 : 0

  source = "./dconf"
}

module "gsettings" {
  count = var.long_term ? 1 : 0

  source = "./gsettings"
}

module "long_term" {
  count = var.long_term ? 1 : 0

  source = "./long_term_utils"
}

module "keys" {
  source = "./keys"

  email      = var.email
  op_connect = var.op_connect
  name       = var.name
  op_vault   = try(data.onepassword_vault.this[0].id, "")
}
