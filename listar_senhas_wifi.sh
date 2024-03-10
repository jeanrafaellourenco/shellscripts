#!/bin/bash

#######################################################################
# Nome do Script: listar_senhas_wifi.sh
# Descrição: Script para listar as senhas de conexões WiFi armazenadas no NetworkManager
# Autor: https://github.com/jeanrafaellourenco
# Data: 18/10/2023
# Dependências: NetworkManager
# Codificação: UTF8
# Nota: Este script deve ser executado como root para acessar os arquivos de configuração do NetworkManager.
#######################################################################

# Verifica se o script está sendo executado como root (para acessar os arquivos do NetworkManager)
if [ "$EUID" -ne 0 ]; then
 echo "Este script deve ser executado como sudo."
 exit 1
fi

# Diretório onde as conexões WiFi são armazenadas
wifi_dir="/etc/NetworkManager/system-connections/"

# Lista todos os arquivos no diretório e analisa seu conteúdo
for connection_file in "$wifi_dir"*; do
 echo "Conexão WiFi: $(basename "$connection_file")"
  
 # Use o comando 'cat' para exibir o conteúdo do arquivo de configuração
 cat "$connection_file" | grep -E 'psk='
 echo "--------------------------------------------------"
done
