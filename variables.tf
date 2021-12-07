variable "email" {
  default     = ""
  description = "The email throughout the configuration for things such as Git."
  type        = string
  validation {
    condition     = length(var.email) > 0
    error_message = "Email is empty, please populate a file named config.auto.tfvars with `email=...`."
  }
}
