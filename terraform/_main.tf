# As configurações e chamadas de módulos serão feitos aqui
resource "azurerm_resource_group" "rg" {
  name     = join("-", [var.resource_group_name, terraform.workspace, var.environment])
  location = terraform.workspace
  tags     = var.tags

  lifecycle {
    replace_triggered_by = [
      tags
    ]
  }
}
