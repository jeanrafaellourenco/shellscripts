#!/bin/bash
# Script para checar os indices de atualização monetária
# mensais ou anual no site do http://www.debit.com.br
# Exemplo: ./atualizacaoMonetaria.sh 01/2021 ou
# ./atualizacaoMonetaria.sh 2021

url="https://www.debit.com.br/tabelas/tabela-completa.php?indice"
periodo=$*
linha="-------------------------"

test $(which lynx) || {
    echo -e "$SCRIPT: pacote 'lynx' requerido: sudo apt-get install -y lynx"
    exit 1
} && test $(which pv) || {
    echo -e "$SCRIPT: pacote 'pv' requerido: sudo apt-get install -y pv"
    exit 1
}
clear
echo "Atualizações do mês/ano: $periodo"
echo "*assp corresponde ao indice TJSP."
echo ""

function atualizarindices_mensais() {
    indices_array=(inpc igpm aasp tjmg tjrj poupanca tjdf tjes)

    for indice in "${indices_array[@]}"; do
        echo "$linha"
        echo "Atualizando $indice....." | pv -qL 15
        lynx --dump $url=$indice | grep $periodo
    done

}

atualizarindices_mensais ${@}
