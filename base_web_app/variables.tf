variable "aws_access_keys" {
  default = "TF_VAR_aws_access_key"
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}


variable "aws_secret_keys" {
  default = "TF_VAR_aws_secret_key"
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}



# access_key = "TF_VAR_aws_access_key"
# secret_key = "TF_VAR_aws_secret_key"
