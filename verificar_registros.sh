#!/bin/bash
######################################################################################################################
# Script de Verificação de Registros DNS
# Autor: https://github.com/jeanrafaellourenco
# Data: 10/03/2024
# Descrição: Este script verifica a presença de registros SPF, DKIM e DMARC para um domínio especificado.
# Ele utiliza o comando nslookup para consultar os registros TXT do DNS e exibe os resultados.

# Modo de Uso:
# ./verificar_registros.sh <domínio>
# Exemplo: ./verificar_registros.sh exemplo.com

# Dependências:
# - nslookup: Ferramenta para consultar registros DNS.

# Notas:
# - Este script deve ser executado em um ambiente Unix/Linux ou em um ambiente Windows com ferramentas compatíveis.
# - Certifique-se de ter permissões adequadas para executar o script.
######################################################################################################################


# Função para verificar a presença de um registro DNS TXT específico
verificar_registro() {
 local dominio=$1
 local registro=$2
 local mensagem_sucesso=$3
 local mensagem_falha=$4

 echo -e "\nVerificando $registro para $dominio"
 resultado=$(nslookup -type=TXT $dominio | grep -q "$registro")

 if [ $? -eq 0 ]; then
    echo -e "$mensagem_sucesso"
    nslookup -type=TXT $dominio | grep "$registro"
 else
    echo -e "$mensagem_falha"
 fi
}

if [ $# -ne 1 ]; then
 echo "Uso: $0 <domínio>"
 exit 1
fi

dominio=$1

# Verifica se o nslookup está presente
[[ ! $(which nslookup 2>/dev/null) ]] && echo -e "O programa 'nslookup' não está instalado no momento. Você pode instalá-lo digitando: \nsudo apt install nslookup -y" && exit 1

# Verificar SPF
verificar_registro "$dominio" "v=spf1" "Registro SPF encontrado" "Registro SPF não encontrado"

# Verificar DKIM
verificar_registro "_adsp._domainkey.$dominio" "canonical name" "Registro DKIM encontrado" "Registro DKIM não encontrado"

# Verificar DMARC
verificar_registro "_dmarc.$dominio" "v=DMARC" "Registro DMARC encontrado" "Registro DMARC não encontrado"
