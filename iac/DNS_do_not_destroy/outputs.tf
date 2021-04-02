output "route53_zone_id" {
  value = aws_route53_zone.main.id
}

output "zone_name" {
  value = aws_route53_zone.main.name
}