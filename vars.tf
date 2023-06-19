variable "region" {
  default = "ap-southeast-4"
}
variable "acm-region" {
  default = "us-east-1"
}
variable "domain" {
  default = "dev.techdebug.com"
  type    = string
}
variable "bucketName" {
  default = "dev.techdebug.com"
  type    = string
}
