resource "aws_route53_zone" "main" {
  name = "shiny-infra.xyz"

  lifecycle {
    prevent_destroy = true
  }
}
