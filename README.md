[![Edit in Eraser](https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fgithub%2FOpen%20in%20Eraser.svg?alt=media&token=968381c8-a7e7-472a-8ed6-4a6626da5501)](https://app.eraser.io/workspace/6Dmm3kkdMBwMDu63GKNU)


![arq](./img/arq.jpg "")

Requisitos :
**IAC**:



- [ ] Toda a infra deve ser provisionada a partir de um script chamado run.sh
- [ ] A infra deve ser provisionada via terraform (iuniciado pelo run.sh)
- [ ] Os itens de Iaas devem ser configurados via Ansible e integrados com o terraform dentro do modulo e não no default (main.tf raiz).
- [ ] As Imagens de vm devem ser criadas via Packer e ter um ciclo de destruição das mesmas.


Infraestrutura: 

- DNS: Hub deverá resolver spoke mas Spoke não resolverá Hub
- Os Acls devem ser feitos via Ip garantindo que somente itens já provisionados possam se comunicar
- !00% do trafego deverá passar pelo terraform
- Todos os itens devem ser monitorados,
- o Aks deve ser provisionado com o jenkins privado
- Os componentes do aks devem ser gerenciados pelo jenkins e deployados cada um com uma pipeline diferente
DR e Monitoramento:

- O kubernetes deverá funcionar em Ativo Ativo 
- Os itens em Iaas devem ser ativo passivo dependendo do load.
- Caso as vms tenham um load alto deveram ser provisionadas em uma segunda zona e ter seu serviço dividido.
- O Monitoramento deve informar quantas máquinas do cluster kafka estão em uso e conseguir utiliza-lo como metrica para provisionamento de novas máquinas dentro de sua propria zona
 ( metrica em linguagem neutra:
 if kafka cluster_cpu and ram use > 80% then provision +1 node wile use > 80% )


# Por onde vou começar
![Primeira etapa](https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fworkspaces%2F6Dmm3kkdMBwMDu63GKNU%2FWLh67fG1zpNvMXmnZ0fSuun7HO22%2F---figure---AO_tY-dx5vhYsSlGDiue----figure---WLgDYB2drEtcaCFqnUIuug.svg?alt=media&token=15be94af-0d6f-41c5-8b41-c8aa61daa99a "Primeira etapa")




<!--- Eraser file: https://app.eraser.io/workspace/6Dmm3kkdMBwMDu63GKNU --->