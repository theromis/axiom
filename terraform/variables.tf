variable "aws_id" {
  description = "AWS id"
  type        = string
}

variable "aws_secret" {
  description = "AWS secret"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = "tf-key"
}

variable "cidr_blocks" {
  description = "A list of CIDR blocks to associate with"
  type        = list(string)
  default     = ["76.77.185.130/32"]
}
