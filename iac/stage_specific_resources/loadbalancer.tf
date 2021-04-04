data "terraform_remote_state" "zone" {
  backend = "s3"
  config = {
    bucket         = "aisim-tf-state"
    key            = "DNS"
    region         = "eu-central-1"
  }
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> v2.0"

  domain_name  = data.terraform_remote_state.zone.outputs.zone_name
  zone_id      = data.terraform_remote_state.zone.outputs.route53_zone_id

  subject_alternative_names = [
    "*.${data.terraform_remote_state.zone.outputs.zone_name}",
  ]

  tags = var.tags
}

resource "aws_security_group" "alb_sg" {
  name =  "${var.tags.Topic}-sg"
  description = "ALB Security Group"
  vpc_id      = module.vpc.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}

resource "aws_alb" "simple_vm" {
  name               = var.tags.Topic
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = tolist(module.vpc.public_subnets)

//  enable_deletion_protection = true
  tags = var.tags
}

resource "aws_lb_target_group" "this" {
  name     = "default-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_alb_listener" "plain_http" {
  load_balancer_arn = aws_alb.simple_vm.arn
  port      = 80
  protocol  = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_302"
    }
  }
}

resource "aws_alb_listener" "secure_http" {
  load_balancer_arn = aws_alb.simple_vm.arn
  port            = 443
  protocol        = "HTTPS"
  ssl_policy      = "ELBSecurityPolicy-2016-08"
  certificate_arn = module.acm.this_acm_certificate_arn
  default_action {
    target_group_arn = aws_lb_target_group.this.arn
    type = "forward"
  }
}


