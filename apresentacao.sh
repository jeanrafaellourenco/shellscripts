#!/bin/bash

#######################################################################
# Nome do Script: apresentacao.sh
# Descrição: Script para exibir uma apresentação no bash.
# Autor: https://github.com/jeanrafaellourenco
# Data: 08/04/2023
# Dependências: curl, sed, pv
# Codificação: UTF8
# Nota: Este script não requer permissões especiais para ser executado.
# Agradecimentos: https://loripsum.net/
#######################################################################

# Verifica se os comandos necessários estão disponíveis
if ! command -v curl >/dev/null 2>&1; then
    echo "Erro: curl não encontrado. Por favor, instale curl."
    exit 1
fi

if ! command -v sed >/dev/null 2>&1; then
    echo "Erro: sed não encontrado. Por favor, instale sed."
    exit 1
fi

if ! command -v pv >/dev/null 2>&1; then
    echo "Erro: pv não encontrado. Por favor, instale pv."
    exit 1
fi

# Script principal
clear
echo -e "\t\t***** MINHA APRESENTAÇÃO *****\n" | pv -qL 25
read opcao;
clear

echo -e "\t\t***** MINHA APRESENTAÇÃO *****\n"
echo -en "- Oque é?" | pv -qL 25
read opcao;

echo -en "$(curl -s "https://loripsum.net/generate.php?p=1&l=short&d=1&a=1" | sed -e 's/<[^>]*>//g')" | pv -qL 25
read opcao;
clear

echo -e "\t\t***** MINHA APRESENTAÇÃO *****\n"
echo -en "- Pra quem é?" | pv -qL 25
read opcao;

echo -en "$(curl -s "https://loripsum.net/generate.php?p=1&l=short&d=1&a=1" | sed -e 's/<[^>]*>//g')" | pv -qL 25
read opcao;
clear

echo -e "\t\t***** MINHA APRESENTAÇÃO *****\n"
echo -en "- Como funciona?" | pv -qL 25
read opcao;

echo -en "1- $(curl -s "https://loripsum.net/generate.php?p=1&l=short&d=1&a=1" | sed -e 's/<[^>]*>//g')\n" | pv -qL 25
read opcao;

echo -en "2- $(curl -s "https://loripsum.net/generate.php?p=1&l=short&d=1&a=1" | sed -e 's/<[^>]*>//g')\n" | pv -qL 25
read opcao;

echo -en "3- $(curl -s "https://loripsum.net/generate.php?p=1&l=short&d=1&a=1" | sed -e 's/<[^>]*>//g')\n" | pv -qL 25

read opcao;
clear

echo -e "\t\t***** MINHA APRESENTAÇÃO *****\n"
echo -en "- Detalhes:" | pv -qL 25
read opcao;

echo -en "$(curl -s "https://loripsum.net/generate.php?p=1&l=medium&d=1&a=1" | sed -e 's/<[^>]*>//g')" | pv -qL 25
read opcao;
clear

#  Perguntas
echo -en "\t\t***** PERGUNTAS? *****\n"
read opcao;
clear

#  Agradecimentos
echo -e "\t\t***** OBRIGADO! *****\n"
echo -en "Agradecimentos: https://loripsum.net/\n"
