module "apt" {
  source = "./apt"
}

module "brew" {
  source = "./brew"
}

module "keys" {
  source = "./keys"

  email = var.email
  name  = var.name
}
