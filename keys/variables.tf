variable "name" {
  description = "The name that should be used as the author and owner of keys."
  type        = string
}

variable "email" {
  description = "The email throughout the configuration for things such as Git."
  type        = string
}

variable "op_connect" {
  description = "Whether to connect to the OnePassword remote. Requires interactive session to input password."
  type        = bool
}

variable "op_vault" {
  description = "The OnePassword vault that should be used to fetch secrets from."
  type        = string
}
