# terraform-module-assume-role
AWS Terraform module to ease the creation of roles designed for aws services.

## Usage
The example below will create a role called "AssumeMyRole" which will grant assume permission
for the role "MyRole" on all account id for the ec2 service.

```
module "assume-role" {
  source = "github.com/kronostechnologies/terraform-module-assume-role?ref=1.0.0"
  assumed_role_name = "MyRole"
  role_name = "AssumeMyRole"
  account_id = "*"
  service = "ec2.amazonaws.com"
}
```

## Variables
See `variables.tf` file
