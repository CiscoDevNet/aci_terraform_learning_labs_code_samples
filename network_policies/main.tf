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

# Define an ACI Tenant VRF Resource.
resource "aci_vrf" "terraform_vrf" {
    tenant_dn   = aci_tenant.terraform_tenant.id
    description = "VRF Created Using Terraform"
    name        = var.vrf
}

# Define an ACI Tenant BD Resource.
resource "aci_bridge_domain" "terraform_bd" {
    tenant_dn          = aci_tenant.terraform_tenant.id
    relation_fv_rs_ctx = aci_vrf.terraform_vrf.id
    description        = "BD Created Using Terraform"
    name               = var.bd
}

# Define an ACI Tenant BD Subnet Resource.
resource "aci_subnet" "terraform_bd_subnet" {
    parent_dn   = aci_bridge_domain.terraform_bd.id
    description = "Subnet Created Using Terraform"
    ip          = var.subnet
}

