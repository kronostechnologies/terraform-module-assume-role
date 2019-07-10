variable "assumed_role_name" {
  description = "The role name which this role can assume in this or other account"
}

variable "role_name" {
  description = "The role name this which will grant access to the assumed_role_name"
}

variable "account_id" {
  default     = "*"
  description = "Which account id can assume the 'assumed_role_name'"
}

variable "service" {
  default     = "ec2.amazonaws.com"
  description = "The aws service we want to grant 'sts:AssumeRole' priviledge"
}

