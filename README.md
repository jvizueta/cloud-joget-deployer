# Cloud Joget Deployer

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
