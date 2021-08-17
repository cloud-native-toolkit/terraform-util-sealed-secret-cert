
locals {
  provided_private_key = var.private_key_file != "" ? file(var.private_key_file) : var.private_key
  provided_cert  = var.cert_file != "" ? file(var.cert_file) : var.cert
  keys_provided = local.provided_private_key != "" && local.provided_cert != ""
  private_key = local.keys_provided ? local.provided_private_key : tls_private_key.generated_key.private_key_pem
  cert  = local.keys_provided ? local.provided_cert : tls_self_signed_cert.cert.cert_pem
}

resource tls_private_key generated_key {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource tls_self_signed_cert cert {
  key_algorithm   = "RSA"
  private_key_pem = local.private_key

  subject {
    common_name  = "sealed-secret"
    organization = "sealed-secret"
  }

  validity_period_hours = 365 * 24

  allowed_uses = [
    "digital_signature",
    "content_commitment",
    "key_encipherment",
    "data_encipherment",
    "key_agreement",
    "cert_signing",
    "crl_signing",
    "encipher_only",
    "decipher_only",
    "any_extended",
    "server_auth",
    "client_auth",
    "code_signing",
    "email_protection",
    "ipsec_end_system",
    "ipsec_tunnel",
    "ipsec_user",
    "timestamping",
    "ocsp_signing",
    "microsoft_server_gated_crypto",
    "netscape_server_gated_crypto"
  ]
}
