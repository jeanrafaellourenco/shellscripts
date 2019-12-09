#!/bin/bash
# Script para checar os indices de atualização monetária
# mensais ou anual no site do http://www.debit.com.br
# Exemplo: ./atualizacaoMonetaria.sh 01/2019 ou
# ./atualizacaoMonetaria.sh 2019


url="http://www.debit.com.br/consulta30.php?indice"
periodo=$*
linha="-------------------------"

test $(which lynx) || { echo -e "$SCRIPT: pacote 'lynx' requerido: sudo apt-get install -y lynx";  exit 1; }  && test $(which pv) || { echo -e "$SCRIPT: pacote 'pv' requerido: sudo apt-get install -y pv";  exit 1; }
clear;
echo "Atualizações do mês/ano: $periodo"
echo "*assp corresponde ao indice TJSP."
echo "";

function atualizarindices_mensais() {
    indices_array=(inpc igpm aasp tjmg tjrj poupanca)

    for indice in "${indices_array[@]}"
    do
    echo "$linha";
    echo "Atualizando $indice....." | pv -qL 15;

    lynx --dump $url=$indice > $indice.txt;
    cat $indice.txt | grep $periodo;

    rm $indice.txt;
    done
}

# Indices como o tjdf e tjes só saem o indice anual portanto eu configuro pra pegar pelo menos dois anos
# sendo o ano atual e o ano anterior.

function atualizarindices_anuais() {
    indices_array=(tjdf tjes)

    echo ""
    echo "Atualizações anual (2017/2018)."

    for indice in "${indices_array[@]}"
    do
    echo "$linha";
    echo "Atualizando $indice....." | pv -qL 15;

    lynx --dump $url=$indice > $indice.txt;
    cat $indice.txt |  grep "/2017";
    cat $indice.txt |  grep "/2018";

    rm $indice.txt;
    done
}

atualizarindices_mensais;atualizarindices_anuais ${@}
