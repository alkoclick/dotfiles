variable "email" {
  default     = ""
  description = "The email throughout the configuration for things such as Git."
  type        = string
  validation {
    condition     = length(var.email) > 0
    error_message = "Email is empty, please populate a file named config.auto.tfvars with `email=...`."
  }
}


variable "gpg_key" {
  description = "The GPG key fingerprint to be used for Git commits."
  type        = string
}

variable "name" {
  default     = "Alexandros Papageorgiou Koufidis"
  description = "The name that should be used as the author and owner of keys."
  type        = string
}
