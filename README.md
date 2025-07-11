# Cloud Joget Deployer

## What is Joget?
Joget is a no-code/low-code platform that helps people build web and mobile apps without needing to write a lot of code.


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
