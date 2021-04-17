variable "default_tags" {
  type = map(string)
  default = {
    "ManagedBy" = "terraform"
    module = "aws-terragrunt-demo-tf-module-core"
  }
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "aws_profile" {
  type    = string
  default = ""
}

variable "aws_provider_role" {
  type    = string
  default = ""
}