```hcl
   terraform {
     backend "azurerm" {
       resource_group_name  = "rg-backendsha"
       storage_account_name = "stterraformsha"
       container_name       = "terraform-state"
       key                  = "terraform.tfstate"
     }
   }