#!/bin/bash
# Sorteia um nome aleatório para finalidades diversas.

#Array de nomes formato nº 1
#nome=( "Paulo" "Maria" "João" "Fernando" "Ana")

#Array de nomes formato nº 2
nome[0]="Paulo"
nome[1]="Maria"
nome[2]="João"
nome[3]="Fernando"
nome[4]="Ana"


#ini e end definem o range de números a serem sorteados.
ini="0"
end=${#nome[@]}

# sorteia um número entre $ini e $end
num_sort=$((RANDOM%$end+$ini))

# mostra o nome que corresponde ao número sorteado
echo -e "${nome[$num_sort]}"
