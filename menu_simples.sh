#!/bin/bash

#######################################################################
# Nome do Script: menu_simples.sh
# Descrição: Script para exibir um menu simples com várias opções para usos diversos.
# Autor: https://github.com/jeanrafaellourenco
# Data: 03/05/2018
# Dependências: lsb_release
# Codificação: UTF8
# Nota: Este script não requer permissões especiais para ser executado.
#######################################################################

# Cores para mensagens no terminal
Warning='\e[0;31m';   BWarning='\e[1;31m';
Alert='\e[0;33m';     BAlert='\e[1;33m';
Gre='\e[0;32m';       BGre='\e[1;32m';

# Obter a versão do sistema operacional
versao=$(/usr/bin/lsb_release -ds);

# Função para exibir o menu
Menu(){
   clear
   echo -e "${BGre}"
   echo -e "----------------------------------------------------"
   echo -e " LinuxAdmin - Meu sistema é: ${BAlert}$versao ${BGre}"
   echo -e "----------------------------------------------------"
   echo -e ""
   echo "[ 1 ] Opção 1"
   echo "[ 2 ] Opção 2"
   echo "[ 3 ] Opção 3"
   echo "[ 0 ] Sair"
   echo
   echo -n "Digite a opcão desejada:   "
   read opcao;
   case $opcao in
      1) opcao1 ;;
      2) opcao2 ;;
      3) opcao3 ;;
      0) clear; echo -e "${BAlert}DESCONECTANDO DO SITEMA, AGUARDE..." ; sleep 3; clear; exit ;;
      *) echo -e "${BWarning}Opcão desconhecida." ; sleep 2; clear; Menu ;;
   esac
}

# Funções para cada opção do menu
opcao1 (){
 echo -e "${BAlert}Executando a primeira opção"
 sleep 3; clear; Menu
}

opcao2 (){
 echo -e "${BAlert}Executando a segunda opção"
 sleep 3; clear; Menu
}

opcao3 (){
 echo -e "${BAlert}Executando a terceira opção"
 sleep 3; clear; Menu
}

# Iniciar o menu
echo -e "${BAlert}INICIANDO SISTEMA, AGUARDE..."; sleep 3; clear; Menu
