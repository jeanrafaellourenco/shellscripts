#!/bin/bash
###################################################################
# Script Name: empregacampinas.sh
# Description: Script de busca de vagas de emprego no site \
# https://empregacampinas.com.br/
# Date: 04/03/2020
# Author: @jeanrafaellourenco
# Dependency: lynx - sudo apt install lynx -y
# TODO: Enviar links para canal do Telegram; Enviar e-mail para as vagas
# Encode: UTF8
###################################################################

clear
echo -e "Digite a vaga que deseja pesquisar: "
read INPUT_STRING
clear
sleep 0.3
echo -e "Buscando vagas que contém: $INPUT_STRING\n"
BUSCA=$(echo -e "$INPUT_STRING" | sed 's/ /+/g')

ERRO=$(lynx --dump https://empregacampinas.com.br/?s=$BUSCA | grep "Ops. Nada encontrado!")
[ "$ERRO" == "Ops. Nada encontrado!" ] && {
    clear
    echo -e "Ops. Nada encontrado!\n\nVocê buscou por: $BUSCA\n\nOlá, infelizmente não foi possível encontrar nenhum conteúdo que coincida com: $BUSCA\nPor favor, refaça sua busca / pesquisa utilizando outra palavra ou expressão."
    exit 1
}

# sort -hr - ordena os resultados da vagas da mais recente para a mais antiga, para inverter remova o parâmetro 'r'
lynx --dump https://empregacampinas.com.br/?s=$BUSCA |
    grep "https://empregacampinas.com.br/$(date +%Y)/" | awk '{ print $2 }' | sort -hr |
    while read line; do
        echo $line
        sleep 1
    done
echo -e "\nFim da busca"

# Páginação (2-3) - Para desativar a páginação comente as linhas abaixo

for i in {2..3}; do
    echo -e "\nBuscando na página $i\n"
    lynx --dump https://empregacampinas.com.br/page/$i/?s=$BUSCA |
        grep "https://empregacampinas.com.br/$(date +%Y)/" | awk '{ print $2 }' | sort -hr |
        while read line; do
            echo $line
            sleep 1
        done
    echo -e "\nFim da busca  na página $i"
done
