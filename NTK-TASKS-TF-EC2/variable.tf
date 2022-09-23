variable "aws_region" {
  default     = "us-west-2"
  description = "Selected aws region to create resources"

}

variable "az_count" {
  default     = "2"
  description = "number of availability zones in above region"
}


variable "app_image" {
  default     = "nginx:latest"
  description = "docker image to run in this ECS cluster"
}


variable "http_port" {
  default     = "80"
  description = "portexposed on the docker image"

}
variable "https_port" {
  default     = "443"
  description = "portexposed on the docker image"
}

variable "app_count" {
  default     = "2"
  description = "number of docker containers to run"
}

variable "health_check_path" {
  default = "/"
}

variable "ips" {
  description = "Two ip addresses to be used"
  type        = list(string)
  default     = ["192.168.0.112/32", "192.168.0.25/32"] #Remember to change the ip addresses
}