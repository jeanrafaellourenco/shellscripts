#!/bin/bash
# script base para acesso ssh em massa, visando execução de comandos em multiplos servidores.
# Ref: https://youtu.be/6PFu746z2Dg
# ips: deve ter um arquivo com esse nome contendo os ips a serem conectados.
# comandos: deve ter um arquivo com esse nome contendo os comandos a serem executados.
# O método abaixo utiliza chave publica/privada.
# Para utilizar com senha:
# sshpass -p 'senha aqui' ssh -o StrictHostKeyChecking=no $USER@$ip "$(cat ./comandos)"


ips=$(cat ./ips)
array_ips=($ips)

for ip in ${array_ips[@]}
do
ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R $ip
ssh -t -o 'StrictHostKeyChecking no' -o ConnectTimeout=10 $USER@$ip "$(cat ./comandos)"
done
