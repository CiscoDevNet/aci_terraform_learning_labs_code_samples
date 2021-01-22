terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

# Configure the provider with your Cisco APIC credentials.
provider "aci" {
  # APIC Username
  username = var.user.username
  # APIC Password
  password = var.user.password
  # APIC URL
  url      = var.user.url
  insecure = true
}

# Define an ACI Tenant Resource.
resource "aci_tenant" "terraform_tenant" {
    name        = var.tenant
    description = "This tenant is created by terraform"
}

# Ensure Tenant has L3 external network.
resource "aci_rest" "terraform_l3out" {
    path   = "api/mo/${aci_tenant.terraform_tenant.id}/out-${var.l3out.name}.json"
    payload = <<EOF
    {"l3extOut": {"attributes": {"descr":${var.l3out.description}, "name":${var.l3out.name}}}}
    EOF
}