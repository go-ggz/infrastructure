output "aws_ggz_eip" {
  description = "The IP of the ggz api server"
  value       = "${ aws_eip.ggz_ip.public_ip }"
}
