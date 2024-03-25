provider "azurerm" {
  features {}
}

# Create the resource group
resource "azurerm_resource_group" "dwrg" {
  name     = "dwazurerm_resource_group.myrg.dw"
  location = "East US 2"  
}

# terraform init
# terraform apply


resource "azurerm_storage_account" "mydatalake" {
  name                     = "dwDataLake"
  resource_group_name      = dwazurerm_resource_group.dwrg.dw
  location                 = "East US 2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_data_lake_analytics_account" "myanalytics" {
  name                = "DWdatalakeanalytics"
  resource_group_name = dwazurerm_resource_group.dwrg.dw
  location            = "East US 2"
  default_store_account_name = azurerm_storage_account.mydatalake.dwstore
}