# Aqui ficarão os arquivos de Locals
locals {
  tags = {
    Environment = terraform.workspace
    CreatedBy   = "terraform"
    Challenge   = "azure-challenge"
  }
}
