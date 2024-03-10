#!/bin/bash

#######################################################################
# Nome do Script: menu_admin.sh
# Descrição: Script para exibir um menu simples com várias opções para usos diversos.
# Autor: https://github.com/jeanrafaellourenco
# Data: 03/05/2018
# Dependências: Nenhuma
# Codificação: UTF8
# Nota: Este script não requer permissões especiais para ser executado.
#######################################################################

# Funções para cada opção do menu
op1() {
	clear
	echo "Executando a primeira opção"
}

op2() {
	clear
	echo "Executando a segunda opção"
}

op3() {
	clear
	echo "Executando a terceira opção"
}

# Função para exibir o menu
menu() {
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

# Loop principal do menu
while true
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
			echo "Desculpe, opção inválida" ;;
	esac
	echo -en "\n\n\t\t\tPressione enter para continuar"
	read -n 1 line
done

clear
