variable "region" {
  default = "ap-southeast-2"
}
variable "acm-region" {
  default = "us-east-1"
}
variable "domain" {
  default = "techdebug.com"
  type    = string
}
variable "bucketName" {
  default = "techdebug.com"
  type    = string
}
