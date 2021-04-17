variable "default_tags" {
  type = map(string)
  default = {
    module = "aws-terragrunt-demo-tf-module-core"
  }
}

variable "aws_profile" {
  type = string
  defaul = ""
}

variable "aws_provider_role" {
  type = string
  defaul = ""
}