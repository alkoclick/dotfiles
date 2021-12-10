variable "email" {
  description = "The email throughout the configuration for things such as Git."
  type        = string
  validation {
    condition     = length(var.email) > 0
    error_message = "Email is empty, please populate a file named config.auto.tfvars with `email=...`."
  }
}

variable "op_connect" {
  description = "Whether to connect to the OnePassword remote. Requires interactive session to input password."
  default     = false
  type        = bool
}

variable "name" {
  default     = "Alexandros Papageorgiou Koufidis"
  description = "The name that should be used as the author and owner of keys."
  type        = string
}
