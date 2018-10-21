output "ggz_public_ip" {
  description = "The IP of the ggz api server"
  value       = "${ aws_eip.ggz_ip.public_ip }"
}

output "ggz_instance_id" {
  description = "The ID of the ggz instance"
  value       = "${ aws_instance.ggz.id }"
}

output "ggz_instance_url" {
  value = "http://${aws_lb.ggz_api.dns_name}"
}

output "ggz_alb_sg_id" {
  description = "The ID of the alb security group"
  value       = "${ aws_security_group.ggz_alb_sg.id }"
}

output "ggz_api_sg_id" {
  description = "The ID of the api security group"
  value       = "${ aws_security_group.ggz_api_sg.id }"
}

output "ggz_alb_dns" {
  description = "The DNS Name of the alb"
  value       = "${ aws_lb.ggz_api.dns_name }"
}
