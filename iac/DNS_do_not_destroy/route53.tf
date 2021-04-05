resource "aws_route53_zone" "main" {
  name = var.zone_name

  lifecycle {
    prevent_destroy = true
  }
}
