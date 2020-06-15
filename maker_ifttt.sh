#!/usr/bin/bash
# Script simples para acionar um evento de webhook no IFTTT

ACTION=$1
KEY="sua_chave_ifttt_aqui"

[ "${ACTION}" == "" ] && {
    echo -e "\nComando não informado, use ex: ./maker_ifttt.sh lamp_on"
    exit 1
}

WEBHOOK=$(curl --silent https://maker.ifttt.com/trigger/${ACTION}/with/key/${KEY})
echo -e "${WEBHOOK}\n"
