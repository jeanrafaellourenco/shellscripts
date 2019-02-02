#!/bin/bash
# Script para checar os indices de atualização monetária
# mensais ou anual no site do http://www.debit.com.br
# Exemplo: ./atualizacaoMonetaria.sh 01/2019 ou
# ./atualizacaoMonetaria.sh 2019


url="http://www.debit.com.br/consulta30.php?indice"
periodo=$*
linha="-------------------------"

pacote1=$(dpkg --get-selections | grep "lynx" )
pacote2=$(dpkg --get-selections | grep "pv" )

if [[ -n "$pacote1" ]] && [[ -n "$pacote2" ]]; then
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


else echo "Os pacotes necessários não estão instalados"
     echo "por favor use: apt-get install -y lynx pv"


fi
