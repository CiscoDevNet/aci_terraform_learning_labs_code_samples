variable "user" {
  description = "Login information"
  type        = map
  default     = {
    username = "admin"
    password = "ciscopsdt"
    url      = "https://sandboxapicdc.cisco.com"
  }
}
variable "tenant" {
    type    = string
    default = "terraform-tenant"
}
variable "l3out" {
    type    = object({
        name    = string
        description = string
    })
    default = {
        name    = "corp_l3"
        description = "Created Using Terraform"
    }
}