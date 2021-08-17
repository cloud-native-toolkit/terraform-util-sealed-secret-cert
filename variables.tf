variable "cert" {
  type        = string
  description = "The public key that will be used to encrypt sealed secrets. If not provided, a new one will be generated"
  default     = ""
}

variable "private_key" {
  type        = string
  description = "The private key that will be used to decrypt sealed secrets. If not provided, a new one will be generated"
  default     = ""
}

variable "cert_file" {
  type        = string
  description = "The file containing the public key that will be used to encrypt the sealed secrets. If not provided a new public key will be generated"
  default     = ""
}

variable "private_key_file" {
  type        = string
  description = "The file containin the private key that will be used to encrypt the sealed secrets. If not provided a new private key will be generated"
  default     = ""
}
