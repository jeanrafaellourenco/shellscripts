#!/bin/bash

######################################################################################################################
# Script de Acesso SSH em Massa
# Autor: https://github.com/jeanrafaellourenco
# Data: 03/05/2018
# Descrição: Este script permite executar comandos em múltiplos servidores via SSH utilizando chaves públicas/privadas.
# Ele lê uma lista de IPs de um arquivo e executa comandos especificados em outro arquivo em cada servidor.

# Modo de Uso:
# ./ssh_em_massa.sh
# Pré-requisitos:
# - Um arquivo 'ips' contendo os IPs dos servidores, um por linha.
# - Um arquivo 'comandos' contendo os comandos a serem executados, um por linha.
# - Chaves SSH configuradas para autenticação sem senha entre o cliente e os servidores.

# Dependências:
# - ssh: Ferramenta para acesso remoto via SSH.
# - ssh-keygen: Ferramenta para gerenciar chaves SSH.

# Notas:
# - Este script deve ser executado em um ambiente Unix/Linux.
# - Certifique-se de ter permissões adequadas para executar o script e acessar os arquivos 'ips' e 'comandos'.
######################################################################################################################

# Função para executar comandos em um servidor via SSH
executar_comandos_ssh() {
 local ip=$1
 local usuario=$2
 local arquivo_comandos=$3

 # Remover entrada antiga do servidor no arquivo known_hosts para evitar conflitos
 ssh-keygen -f "/home/$usuario/.ssh/known_hosts" -R $ip

 # Executar comandos no servidor via SSH
 ssh -t -o 'StrictHostKeyChecking no' -o ConnectTimeout=10 $usuario@$ip "$(cat $arquivo_comandos)"
}

# Verificar se os arquivos 'ips' e 'comandos' existem
if [ ! -f "./ips" ] || [ ! -f "./comandos" ]; then
 echo "Arquivo de IPs ou arquivo de comandos não encontrado. Verifique se ambos os arquivos existem no diretório atual."
 exit 1
fi

# Ler o arquivo de IPs e executar comandos em cada servidor
ips=$(cat ./ips)
array_ips=($ips)
usuario=$USER # Utiliza o nome de usuário do sistema

for ip in ${array_ips[@]}
do
 executar_comandos_ssh $ip $usuario "./comandos"
done
