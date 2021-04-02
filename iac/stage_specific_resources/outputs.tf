output "bastion_instance_id" {
  value = concat(aws_instance.bastion.*.id, [""])[0]
}

output "access_from_bastion_sg_id" {
  description = "Security group ID that allows access to the resources from bastion."
  value       = concat(module.access_from_bastion_sg.*.this_security_group_id, [""])[0]
}
