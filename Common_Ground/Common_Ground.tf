terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "45654f43-f899-45ea-b1e1-41582688985f"
    resource_group_name  = "sumitRG"
    storage_account_name = "sumitvatssa"
    container_name       = "sumitvatssc"
    key                  = "RG-SA_Module_terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "45654f43-f899-45ea-b1e1-41582688985f"
}

module "aarushrg_test" {
  source = "F:\\Sumit_devOps\\Terraform\\Terraform_code\\Resource_segregation\\azurerm_resource_group"
}

module "aarushsa_test" {
  depends_on = [module.aarushrg_test]
  source     = "F:\\Sumit_devOps\\Terraform\\Terraform_code\\Resource_segregation\\azurerm_storage_account"
}