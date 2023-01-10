# To-dos do desafio

Esta lista de to-dos foi criada para organizar e orquestrar as atividades que serão necessárias para fazer este cenário.

# Visão Geral
Esta é a lista de componentes que serão usados neste cenário:
 - [x] Resource Group
 - [x] Virtual Network
 - [x] Subnet
 - [x] Tag
 - [ ] Azure Container Registry
 - [ ] Azure Container Instance
 - [x] Virtual Network Peering
 - [ ] Azure Virtual Machine + Disks
 - [ ] Azure Load Balancer
 - [ ] Azure Application Gateway
 - [ ] Azure Front Door
 - [ ] Azure Monitor
 - [ ] Azure Kubernetes Service
 - [x] Network Security Group
 - [ ] Route Table
 - [ ] Storage Account
 - [ ] Azure Firewall

# Azure Cloud
- Requisitos gerais
    - [x] Preparar Azurerm provider
    - [ ] Criar nas regiões East US e West US
- Redes 
    - Balanceadores de Carga: 
        - Balanceadores de Carga dos BDs
            - [ ] Criar Backend Pool para o BD
            - [ ] Criar Health Probe para o BD
            - [ ] Cirar LB Rule para o BD
        - Balanceadores de Carga da mensageria
            - [ ] Criar Backend Pool para o kafka
            - [ ] Criar Health Probe para kafka
            - [ ] Cirar LB Rule para o kafka
    - NSGs:
        - [x] Criar NSG da Subnet Public
            - Regras: 
                - [x] Allow Porta 80, 443 a partir da internet
        - [x] Criar NSG da Subnet Private
            - Regras: 
                - [ ] Permitir 2181 a partir da Subnet Public
        - [x] Criar NSG da Subnet Database
            - Regras: 
                - [ ] Permitir 3306 a partir da Subnet Private
        - [x] Criar NSG da subnet Streaming / MSG
            - Regras: 
                - [ ] Permitir 2181 a partir da Subnet Private
        - [x] Criar NSG da Subnet Shared
            - Regras:
                - [ ] Permitir Conectividade com todas as subnets nos protocolos usados pelo Jenkins e recursos PaaS.
        - [x] Criar NSG da Subnet MGMT
            - Regras: 
                - [ ] Permitir conexão na porta 22 apenas no IP público do criado
    - UDRs:
        - [ ] Todas as rotas devem ir para o Azure Firewall
        - [ ] Todas as subnets devem ser associadas à mesma tabela de rotas
- Compute:
    - [ ] Criar VMs em Zonas de Disponibilidade
    - Virtual Machies:
        - [ ] Web Servers
        - [ ] Zookeepers
        - [ ] Redis Cache
        - [ ] Kafka
- Containers
    - [ ] Criar um Cluster do Kubernetes com 1 Node Pool
- Gerenciamento
    - TBD

# Requisitos de plataformas
 - Mensageria: Kafka e RabbitMQ
 - Cache: Redis
 - Banco de dados: MySQL
 - Kubernetes: AKS (Ingress está livre de usar o que quiser)
 - Monitoramento: Azure Monitor
 - Web server: NGINX
