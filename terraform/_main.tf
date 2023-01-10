# As configurações e chamadas de módulos serão feitos aqui
resource "azurerm_resource_group" "rg" {
  name     = join("-", [var.resource_group_name, terraform.workspace, var.environment])
  location = terraform.workspace
  tags     = local.tags
}

module "networking" {
  source              = "git::git@ssh.dev.azure.com:v3/swonelab/Modulos_Terraform/terraform-azurerm-sln-networking?ref=v0.0.3"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = azurerm_resource_group.rg.tags

  vnet_name          = "vnet-hub"
  vnet_address_space = ["10.0.0.0/16"]

  hub_extra_subnets = {
    mgmtSubnet = {
      address_prefix = "10.0.0.0/27"
      nsg_name       = join("-", ["nsg", "mgmt", terraform.workspace])
    }
    sharedSubnet = {
      address_prefix = "10.0.0.32/27"
      nsg_name       = join("-", ["nsg", "shared", terraform.workspace])
    }
  }



  vnet_spokes = {
    vnet-app = {
      address_space = ["10.1.0.0/16"]
      subnets = {
        public = {
          address_prefix = "10.1.0.0/27"
          nsg_name       = join("-", ["nsg", "public", terraform.workspace])
          nsg_rules = [
            {
              priority               = 100
              name                   = "allow_http_https_in"
              description            = "Allow Http and Https from the internet."
              destination_port_range = "80,443"
            }
          ]
        }
        private = {
          address_prefix = "10.1.0.32/27"
          nsg_name       = join("-", ["nsg", "private", terraform.workspace])
          nsg_rules = [
            {
              priority               = 100
              name                   = "allow_zookeeper_in"
              description            = "Allow Http and Https from the internet."
              destination_port_range = "2181"
            }
          ]
        }
        database = {
          address_prefix = "10.1.0.64/28"
          nsg_name       = join("-", ["nsg", "database", terraform.workspace])
          nsg_rules = [
            {
              priority                = 100
              name                    = "allow_mysql_in"
              description             = "Allow MySQL Connection from frontend."
              source_address_prefixes = ["10.1.0.0/27"]
              destination_port_range  = "3306"
            }
          ]
        }
        streaming = {
          address_prefix = "10.1.0.80/28"
          nsg_name       = join("-", ["nsg", "streaming", terraform.workspace])
          nsg_rules = [
            {
              priority               = 100
              name                   = "allow_http_https_in"
              description            = "Allow Http and Https from the internet."
              destination_port_range = "80,443"
            }
          ]
        }
      }
    }
  }
  depends_on = [
    azurerm_resource_group.rg
  ]
}
