variable "user" {
  description = "Login information"
  type        = map
  default     = {
    username = "admin"
    password = "ciscopsdt"
    url      = "https://sandboxapicdc.cisco.com"
  }
}
