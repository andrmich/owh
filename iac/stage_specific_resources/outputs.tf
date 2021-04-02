output "bastion_instance_id" {
  value = concat(aws_instance.bastion.*.id, [""])[0]
}

output "access_from_bastion_sg_id" {
  description = "Security group ID that allows access to the resources from bastion."
  value       = concat(module.access_from_bastion_sg.*.this_security_group_id, [""])[0]
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}
output "alb_dns_name" {
  value = aws_alb.simple_vm.dns_name
}

output "alb_secure_listener_arn" {
  value = aws_alb_listener.secure_http.arn
}