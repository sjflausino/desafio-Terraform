# desafio-Terraform

## Criando vms na Aws utilizando terraform
#### Ambiente 2 com 2vms sendo uma delas dependente do rds Postgres
#### Ambiente 3 com 3vms sendo uma delas dependente do rds Mysql
#### Ambiente Docker com 1Vm com Docker instalado e imagem openjdk:11 provisionada via Ansible

# Criando chave ssh

  Precisamos primeiramente criar uma chave ssh para conseguirmos conectar em nosso ambiente na aws e referencia-la no terraform, pra isso rodaremos no diretorio do projeto as seguintes instruções:
```
ssh-keygen -f terraform-aws -t rsa
```
```
mv terraform-aws ~/.ssh/
```
  Na aws precisaremos importar a chave terraform-aws.pub para aws com o nome terraform-aws, após isso ja podemos partir para a clonagem do repositório
  Após isso clonaremos o repositorio e realizaremos a configuração dos ambientes
```
git clone https://github.com/sjflausino/desafio-Terraform.git
```

## Ambiente 2 e 3
Este processo é o mesmo tanto para o Ambiente 2 quanto para o Ambiente 3

```
cd desafio-Terraform/Ambiente2
```
```
terraform init
```
```
terraform apply
```

### Caso queria excluir o ambiente basta executar:

```
terraform destroy 
```

## Ambiente Docker

```
cd desafio-Terraform/AmbienteDocker
```
```
terraform init
```
```
terraform apply
```
Após o provisionamento iremos copiar o DNS que recebemos no final da execução e mudaremos para o diretório ansible
```
cd ansible
```
E após estar no diretorio abra o aquivo host com seu editor de preferencia e substitua o DNS atual pelo DNS que recebemos após execução do passo anterior, salve e execute o seguinte comando:
```
ansible-playbook provisioning.yml -i host
```
Digite yes para a verificação do ssh e aguarde o provisionamento da vm


Após isso conecte via ssh utilizando o comando:

```
ssh -i "~/.ssh/terraform-aws" ubuntu@"<DNS>"
```
E execute um "docker images" para verificar se o provisionamento ocorreu corretamente!

### Caso queria excluir o ambiente basta executar:

```
exit
```
```
cd ..
```
```
terraform destroy 
```

