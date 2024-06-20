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

    resultado=$(nslookup -type=TXT "$dominio" | grep -q "$registro")

    if [ $? -eq 0 ]; then
        echo -e "$mensagem_sucesso"
        nslookup -type=TXT "$dominio" | grep "$registro"
        echo  # Adiciona uma quebra de linha após cada registro encontrado
        return 0  # Retorna sucesso
    else
        echo -e "$mensagem_falha"
        echo # Adiciona uma quebra de linha após cada registro não encontrado
        return 1  # Retorna falha
    fi
}

# Função para verificar DKIM com base em seletores
verificar_dkim() {
    local dominio=$1
    local seletores=("${@:2}")
    local dkim_encontrado=false

    for sel in "${seletores[@]}"; do
        if verificar_registro "${sel}._domainkey.${dominio}" "canonical name" "Registro DKIM encontrado para o seletor $sel" "Nenhum registro DKIM encontrado para o seletor $sel"; then
            dkim_encontrado=true
        fi
    done

    if ! $dkim_encontrado; then
        echo -e "Nenhum registro DKIM encontrado para o domínio $dominio"
    fi
}

if [ $# -ne 1 ]; then
    echo "Uso: $0 <domínio>"
    exit 1
fi

dominio=$1

# Verifica se o nslookup está presente
if ! which nslookup >/dev/null 2>&1; then
    echo -e "O programa 'nslookup' não está instalado no momento. Você pode instalá-lo digitando: \nsudo apt install nslookup -y"
    exit 1
fi

# Verificar SPF
verificar_registro "$dominio" "v=spf1" "Registro SPF encontrado" "Registro SPF não encontrado"

# Lista de seletores DKIM para testar
seletores=("amazon" "api" "dkim" "fd" "fd2" "fdm" "google" "k2" "k3" "mandrill" "mimecast" "mxvault" "protonmail13" "s1" "s2" "selector1" "selector2" "tm1" "tm2" "zmail")

# Verificar DKIM
verificar_dkim "$dominio" "${seletores[@]}"

# Verificar DMARC
verificar_registro "_dmarc.$dominio" "v=DMARC" "Registro DMARC encontrado" "Registro DMARC não encontrado"
