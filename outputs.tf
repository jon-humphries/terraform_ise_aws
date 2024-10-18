output "ise_pan_public_ip_address" {
  description = "The Public IP Address of the first ISE Node."
  value = aws_instance.ise_pan.public_ip
}
output "ise_san_public_ip_address" {
  description = "The Public IP Address of the second ISE Node."
  value = aws_instance.ise_san.public_ip
}
