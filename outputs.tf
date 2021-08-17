
output "private_key" {
  value = local.private_key
  sensitive = true
}

output "cert" {
  value = local.cert
}
