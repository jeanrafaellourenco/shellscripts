#!/bin/bash
# Menu simples para usos diversos.

function op1 {
	clear
	echo "Executando a primeira opção"
}

function op2 {
	clear
	echo "Executando a segunda opção"
}

function op3 {
	clear
	echo "Executando a terceira opção"
}

function menu {
	clear
	echo
	echo -e "\t\t\tAdmin Menu\n"
	echo -e "\t1. Primeira opção"
	echo -e "\t2. Segunda opção"
	echo -e "\t3. Terceira opção"
	echo -e "\t0. Sair\n\n"
	echo -en "\t\tEscolha uma opção: "
	read -n 1 option
}

while [ 1 ]
do
	menu
	case $option in
	0)
	break ;;
	1)
	op1 ;;

	2)
	op2 ;;

	3)
	op3 ;;

	*)
	clear
	echo "Desculpe, opção inválida";;
	esac
	echo -en "\n\n\t\t\tPressione enter para continuar"
	read -n 1 line
done
clear
