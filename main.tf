terraform {
  backend "s3" {
    bucket         = "aisim-tf-state"
    key            = "simple_vm"
    region         = "eu-central-1" # Bucket region, not deployment region
    dynamodb_table = "terraform-state-locking"
  }
}

data "terraform_remote_state" "stage_resources"  {
  backend = "s3"
  config = {
    bucket         = "aisim-tf-state"
    key            = "stage-specific-vpc-bastion"
    region         = "eu-central-1"
  }
}

data "terraform_remote_state" "dns" {
  backend = "s3"
  config = {
    bucket         = "aisim-tf-state"
    key            = "DNS"
    region         = "eu-central-1"
  }
}

resource "aws_security_group" "vm_sg" {
  name        = var.tags.Topic
  description = "simple_vm Security Group"
  vpc_id      = data.terraform_remote_state.stage_resources.outputs.vpc_id

  ingress {
  # ingress rule for SSH communication
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = tolist(data.terraform_remote_state.stage_resources.outputs.private_subnets_cidr_blocks)
  }
  # nginx
  ingress {
    # ingress rule for HTTP communication
    from_port = 4000
    to_port = 4000
    protocol = "tcp"
    security_groups = [data.terraform_remote_state.stage_resources.outputs.alb_sg_id]
  }
  ingress {
    # allow echo / ping requests
    from_port = 8
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "simple_vm" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id              = data.terraform_remote_state.stage_resources.outputs.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.vm_sg.id, data.terraform_remote_state.stage_resources.outputs.access_from_bastion_sg_id ]
  key_name               = aws_key_pair.simple_vm.key_name
  tags = merge(var.tags, map("Instance", "Web"))
}


resource "aws_key_pair" "simple_vm" {
  key_name   = var.tags.Topic
  public_key = var.pub_key
}


resource "aws_alb_target_group" "nginx" {
  name     = "${var.tags.Topic}-nginx"
  port     = 4000
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.stage_resources.outputs.vpc_id
  health_check {
    interval            = 10
    path                = "/"
    port                = 4000
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200,302"
  }
  tags = var.tags
}

resource "aws_alb_target_group_attachment" "nginx" {
  target_group_arn = aws_alb_target_group.nginx.arn
  target_id = aws_instance.simple_vm.id

}

resource "aws_alb_listener_rule" "nginx_rule" {
  listener_arn  = data.terraform_remote_state.stage_resources.outputs.alb_secure_listener_arn
  priority      = 122
  action {
    target_group_arn = aws_alb_target_group.nginx.arn
    type = "forward"
  }
  condition {
    host_header {
    values = ["simple-vm.*"]
  }
  }
}

# simple-vm.shiny-infra.xyz
resource "aws_route53_record" "simple_vm" {
  zone_id = data.terraform_remote_state.dns.outputs.route53_zone_id
  name = "simple-vm.${data.terraform_remote_state.dns.outputs.zone_name}"
  type = "A"

  alias {
    name = data.terraform_remote_state.stage_resources.outputs.alb_dns_name
    zone_id =  data.terraform_remote_state.stage_resources.outputs.alb_zone_id
    evaluate_target_health = true
  }
}

