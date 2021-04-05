# Overengineered Website Hosting - OWH

[![terraform](https://img.shields.io/badge/terraform-v0.14-informational?style=for-the-badge&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAq1BMVEX///9cTuVeUeRcTuZcTuZcT+VbSe1cTuVdT+MAAP9JSbZcT+VcTuZAQLFAQLJcTuVcTuZcUuBBQbA/P7JAQLJaTuRcT+RcTuVGQ7xAQLJVVf9cTuVcTuVGRMFeUeRbTeJcTuU/P7JeTeZbTOVcTeZAQLJBQbNAQLNaUORcTeZbT+VcTuRAQLNAQLRdTuRHR8xgUOdgUN9cTuVdTeRdT+VZTulcTuVAQLL///8+GmETAAAANnRSTlMApibw+osO6DcBB3fIX87+oRk3yehB0/Nj/gNs7nsTRv3dHmu//JYUMLVr3bssjxkgEK5CaxeK03nIAAAAAWJLR0QAiAUdSAAAAAlwSFlzAAADoQAAA6EBvJf9gwAAAAd0SU1FB+EEBRIQDxZNTKsAAACCSURBVBjTfc7JFsFQEATQQpCYxyBEzJ55rvf/f0ZHcyQLvelTd1GngEwWycs5+UISyKLraSi9geWKK9Gr1j7AeqOJVtt2XtD1Bchef2BjQDAcCTC0CsA4mihMtXw2XwgsV2sFw812F+4P3y2GdI6nn3FGSs//4HJNAXDzU4Dg/oj/E+bsEbhf5cMsAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE3LTA0LTA1VDE4OjE2OjE1KzAyOjAws5bLVQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxNy0wNC0wNVQxODoxNjoxNSswMjowMMLLc+kAAAAZdEVYdFNvZnR3YXJlAHd3dy5pbmtzY2FwZS5vcmeb7jwaAAAAC3RFWHRUaXRsZQBHcm91cJYfIowAAABXelRYdFJhdyBwcm9maWxlIHR5cGUgaXB0YwAAeJzj8gwIcVYoKMpPy8xJ5VIAAyMLLmMLEyMTS5MUAxMgRIA0w2QDI7NUIMvY1MjEzMQcxAfLgEigSi4A6hcRdPJCNZUAAAAASUVORK5CYII=)](https://terraform.io/)
[![ansible](https://img.shields.io/badge/ansible-2.10-informational??style=for-the-badge&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAACAVBMVEUAAAAAAAAAAAAAAAACAgIDAwMCAgICAgIDAwMCAgIDAwMCAgIAAAAAAAABAQECAgIDAwMAAAADAwMDAwMDAwMDAwMDAwMDAwMDAwMAAAADAwMDAwMDAwMDAwMAAAAAAAACAgIBAQEFBQUaGhodHR0REREAAAAEBAQAAAAAAAADAwMCAgIODg4DAwMXFxebm5vIyMhISEgfHx9FRUX///+wsLAkJCQAAAAjIyOkpaTn5+cvLy8AAAADAwMYGBje3t78/PyWlpYnJycAAAADAwMgICB+fn7r7OvAwMDV1dUUFBQCAgIPDw8JCQnFxcVAQED4+fhvb28hISEDAwNYWFj29vbMzMy6uroDAwOtra2IiIjv7+9EREQCAgKdnZ3h4eGenp4DAwOTk5PPz882NjarrKsDAwP7+/vm5uZycnJfX1/19fUlJSXR0dH39/eamprHx8e7u7vf39/Dw8Ourq5aWlpGRkbs7OylpaWmpqbT09Pp6emvsLDx8fFTU1MqKiqEhIT5+fnl5uUWFhbX19fDxMMMDAwTExNcXFyAgIAoKCjKysrS0tKqqqrw8PDJycmvr6/z8/MKCgoBAQEPDg8zMzMGBgYCAgIAAAAAAAACAgICAgIDAwMCAgIEBAQDAwMCAgLw8PD///8bGxu8vLwAAAApKSkGBgYFBQUNDQ0LCwvFZZ9hAAAAnnRSTlMAAwIeXZa+1e+9lVwEL5rmmQmJ9f76+fyIJ8r7/ckmNOf+/v7+/v7+MgX3/v74/v7+/v7+/v7+MP7+/v4umP7+/v7+Hef+/v7+/v7l/v7+/v7+/pf+/v7+wP7+/v7Y/v7+8f7+/v7u/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v77/v7++zMcW7/w19nI/4YAAAABYktHRDSpsen9AAAAB3RJTUUH5QQFCxMDvLCJqgAAAq5JREFUOMtVU2dDE0EQXUCkGyB3CXBBuQRelAuIcVREBaQpSFRA7CBiwV4Qu9hQsBcsSHGCBduvdPfuQnQ+7e28m30z854QdqSkCpG2JH1pRmZmRlZ2Tpq8SRH/RK4Qecs8vBie/Dz7MpkvKPQya7rP5/f7fLqEeIsKkohcUVzCbOgB5nic55kDusFcujyByBUrylg3NNY0Mxgqr0BYHg2dPSsdxCpR7OFKTYUVjgBQCBmV7LFrpIiCEq5iG6BVY3XNGlRDnbmSSwtkOlUUsm5nw4hi7Rdah/VOCU3nIgkQG7xsOAXMWmz8SnWb8M0uoRns3Sw5bGGfk0c90ECNtBVNbgmD84VobmHdLdCKNtq2ndqBDoeFzjuaRQ777TSbnTHspO+7djd2LXTD/kcOJkf0JF6wQtjTS23YS/tQETHdEtlif6IHqxUHqKEJB+nQYYQcgI+zRB8bDoMOROuoH6HoERpANOwCMsRRDqhjWFIfJDp2HDhBDUCnmjz7+aQL0MxIEO00RKdO48xZyaRWdWoDnCfCOIeuIeo/Txcu4hLVIBRMPOGQNGP1uEzDwBWikTbqvYputVRF0mlTruHadbohd3mT6NZtuoNa023THpQVLMcAjd7FPQv3R+kBPfyBcmgBTQ5Kjtpgcwx4RI8xHpuI4skwEQ2i1ZQFPM3ussrlfOgpWi0EnyH6nOiFWoi9LHvdPyfw8tXrqJTKL1P2s/Dm7Qgmx9+xV4rbEQxite+BmD1gSRgfgElTCSbVlZwchMxbmppfGB0T8mO+ypGcI9oq6/dExHKEKREfx/6YVa5obdl7WJ+Kx7XF4Pkp2cGnpDGUcXy6Jh2lsspi0jjF/1rLtp5f141AwNCVxf6znuIh8npakuYt68mzL5Oh7D89kz7bNzf3eTZ9Zlq279r/L1mj2Al5mD2pAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTA0LTA1VDExOjE4OjU0KzAwOjAwpupfdgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wNC0wNVQxMToxODo1NCswMDowMNe358oAAAAASUVORK5CYII=)](https://www.ansible.com/)

[![Website simple-vm.shiny-infra.xyz](https://img.shields.io/website-up-down-green-red/https/simple-vm.shiny-infra.xyz.svg)](https://simple-vm.shiny-infra.xyz/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=shields)](http://makeapullrequest.com)

[![forthebadge](https://forthebadge.com/images/badges/contains-17-coffee-cups.svg)](https://forthebadge.com) 

Overengineered way of setting up a static webpage hosting to make the best use of my time to shine.

# Table of contents

- [Task overview](#task-overview)
- [Solution](#solution)
    - [Infrastructure overwiew](#infrastructure)
    - [Provisioning](#provisioning)
    - [Monitoring](#monitoring)
- [Requirements](#requirements)
- [Usage](#usage)
- [License](#license)

# Task overview

I was tasked with: 

- creating a LinuxVM that is only accessible via ssh keys
- running a web server which will serve a static page displaying "Hello my name is <yourname>". It should use scripts to connect to said machine and deploy a simple website there
- creating a monitoring script, that verifies whether the site is up: [![Website simple-vm.shiny-infra.xyz](https://img.shields.io/website-up-down-green-red/https/simple-vm.shiny-infra.xyz.svg)](https://simple-vm.shiny-infra.xyz/)

I decided to have some fun with it and create a "production ready" solution.

# Solution

## Infrastructure overview

[(Back to top)](#table-of-contents)

The website is served by **nginx** web server, running in **docker** container, on the **Simple VM** virtual machine.

Simple VM is an **AWS EC2** instance.
It is created in a **private subnet**, so it cannot be accessed directly from the Internet.

User access (HTTP/HTTPS) is handled by **AWS Application Load Balancer**.
It terminates TLS using certificate generated with AWS Certificate Manager (ACM).

Management access to Simple VM is possible with SSH, using the **bastion** host.
It is used by **GitHub Actions** to deploy new versions of the application.

The entire infrastructure for the project is contained in this repository, in **terraform** files.

### Diagram
![infrastructure diagram](./shiny-infra.svg)

## Provisioning

The web server is provisioned using an **Ansible** playbook.
Ansible connects to the VM using SSH, tunneling via the bastion host.

It uses aws_ec2 **dynamic inventory** to get VM's IP address.

## Monitoring

For a simple health check there's the `monitoring_script.sh`.
It performs a HTTP GET request and if the result differs from the expected value, it sends an email to defined recipients.

The script can be run with `cron`.

The biggest issue with this approach is the fact that the script doesn't save the previous state and will continue to send emails again and again, with each run (as long as the website is down).

I plan to add **Prometheus** with **Alertmanager** and **Blackbox exporter** to this project, to handle monitoring and alerting properly. 

Additionally, the 
[![Website simple-vm.shiny-infra.xyz](https://img.shields.io/website-up-down-green-red/https/simple-vm.shiny-infra.xyz.svg)](https://simple-vm.shiny-infra.xyz/)
badge shows the current status of the website 😉. Click it to see for yourself.


# Requirements

- AWS account with sufficient access to create the resources
- `terraform >= 0.14`
- `ansible`

# Usage

[(Back to top)](#table-of-contents)

Setting up the project is partially automated with GitHub Actions.

## AWS resources

### Manual steps

#### I. terraform boilerplate

S3 bucket and DynamoDB table to store terraform state.

This step is a bit complex, due to the way how terraform handles state by default.

1. `cd iac/terraform_boilerplate`

2. `cp terraform.tfvars.example terraform.tfvars` 

3. Modify `terraform.tfvars` accordingly.

4. Edit `state.tf` file.
   - Change the bucket name in the marked line to the one set in `terraform.tfvars`
   - Comment (with `#`) the marked lines out. This is necessary, because the bucket does not exist yet.

5. `terraform init && terraform apply`

6. Edit `state.tf` file again.
   - Uncomment the lines commented in the previous step.

7. `terraform init && terraform apply`

#### II. DNS zone

This step creates Route53 hosted zone. 
It's called "do not destroy", because this resource does not generate any costs and recreating it might force you to make changes in DNS setup outside AWS 
(since new hosted zone might get different nameservers).

1. `cd iac/DNS_do_not_destroy`

2. `cp terraform.tfvars.example terraform.tfvars` 

3. Modify `terraform.tfvars` accordingly.

4. Edit `versions-state.tf` file.
   - Change the bucket name in the marked line to the one created in [step I](#i-terraform-boilerplate)

5. `terraform init && terraform apply`

Set up your domain's DNS NS records according to [this guide](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/migrate-dns-domain-inactive.html).

#### III. Stage specific resources

This step creates the VPC, ALB and the bastion host.

1. `cd iac/stage_specific_resources`

2. `cp terraform.tfvars.example terraform.tfvars` 

3. Modify `terraform.tfvars` accordingly.

4. Edit `terraform_boilerplate.tf` file.
   - Change the bucket name in the marked line to the one created in [step I](#i-terraform-boilerplate)

5. `terraform init && terraform apply`

### GitHub Actions

Steps below are executed in GitHub Actions pipeline.
However, if you wish to run it manually (without forking the repo and setting up your own pipeline), see the instructions below.

#### IV. The VM itself

In the repo root directory:

1. `cp terraform.tfvars.example terraform.tfvars` 

2. Modify `terraform.tfvars` accordingly.

3. Edit `terraform_boilerplate.tf` file.
   - Change the bucket name in the marked line to the one created in [step I](#i-terraform-boilerplate)

4. `terraform init && terraform apply`

## Website deployment

Website deployment is automated with GitHub Actions and Ansible. Manual steps:

1. In the repo root directory run:

``` shell
export PATH_TO_YOUR_PRIVATE_KEY='~/.ssh/id_rsa'  # Modify as needed.
export IP_PUB=$(aws ec2 describe-instances --filters 'Name=tag:Instance,Values=Bastion' --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
ansible-playbook -i inventories/dynamic_aws_ec1.yml provision.yml --ssh-common-args "-J ubuntu@$IP_PUB" --private-key $PATH_TO_YOUR_PRIVATE_KEY
```

You may need to modify the `--filters` above if you changed the tags for the bastion instance or if you have more than one instance with such tags in your account. 

# License

[(Back to top)](#table-of-contents)


The MIT License (MIT) 2021 - [Michalina Andrzejewska](https://github.com/andrmich/). Please have a look at the [LICENSE.md](LICENSE.md) for more details.


