variable "environment" {
  description = "The environment for which this instance is being created"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Instance type based on the environment"
  type        = string
  default     = "t2.micro"
}

# Map environment to instance types
variable "instance_type_map" {
  description = "Map environment to instance types"
  type        = map(string)
  default = {
    dev  = "t2.micro"
    test = "t2.micro"
    prod = "t2.large"
  }
}



variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

# provider "aws" {
#   region     = "us-east-1"
#   access_key = var.aws_access_key
#   secret_key = var.aws_secret_key
# }
