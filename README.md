# Cloud Joget Deployer

## What is Joget?
Joget is a no-code/low-code platform that helps people build web and mobile apps without needing to write a lot of code.

## What does the code in this repo do?
Creates a Joget VM in Azure with the following resources:

### Terraform:

1. Resource Group
1. Virtual Network
1. Subnet
1. Public (dynamic) IP
1. NIC
1. VM (based on Ubuntu 24.04)
1. SSH Key
1. OS Disk
1. Network Security Group with Security Rules
1. A DNS Zone "A" record ALIAS for the Public (dynamic) IP 

Internally in the VM it creates:

### Ansible:

1. Joget DX 8
1. MySQL Engine
1. MySQL Database for Joget
1. nginx reverse proxy
1. Cerbot with Let's Encrypt certificate


## How do I use this code?

Need to change the following variables at:

```
/ansible/joget.yml
db_password
joget_domain
certbot_email

/ansible/templates/all.yml.tpl
certbot_email

/terraform/azure/vm/terraform.tfvars
*create the file and add all variables based on the variables.tf file
```
