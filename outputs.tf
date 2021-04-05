output "private_ip" {
  value     = aws_instance.simple_vm.private_ip
  sensitive = true
}
