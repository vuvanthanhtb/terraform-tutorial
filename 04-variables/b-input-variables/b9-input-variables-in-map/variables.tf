variable "my_instance_type" {
  description = "instance type"
  type        = map(string)
  default = {
    "micro_type" = "t2.micro"
    "small_type" = "t2.small"
  }
}

variable "my_key_pair" {
  description = "key pair name"
  type        = string
  default     = "terraform-study-key-pair"
}

variable "instance_count" {
  description = "number of instances"
  type        = number
  default     = 1
}

variable "my_volume_size" {
  description = "volume size"
  type        = number
  default     = 20
}

variable "my_region" {
  description = "region"
  type        = string
  default     = "us-east-1"
}
