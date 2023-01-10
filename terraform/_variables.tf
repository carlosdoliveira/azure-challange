#------------------------
# Global Variables
#------------------------

variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "environment" {
  type        = string
  description = "Tipo de ambiente a ser criado. Pode-se usar `dev`, `hml`, `prd`."
  default     = "dev"
}

variable "tags" {
  type        = map(any)
  description = "Mapa de tags a serem usadas para o ambiente"
  default     = {}
}

#------------------------
# Network Variables
#------------------------


#------------------------
# Compute Variables
#------------------------


#------------------------
# Containers Variables
#------------------------


#------------------------
# Management Variables
#------------------------
