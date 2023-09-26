variable "user" {
  description = "Login information"
  type        = map
  default     = {
    username = "admin"
    password = "!v3G@!4@Y"
    url      = "https://sandboxapicdc.cisco.com"
  }
}
variable "tenant" {
    type    = string
    default = "terraform-tenant"
}
variable "vrf" {
    type    = string
    default = "prod_vrf"
}
variable "bd" {
    type    = string
    default = "prod_bd"
}
variable "subnet" {
    type    = string
    default = "10.10.101.1/24"
}
