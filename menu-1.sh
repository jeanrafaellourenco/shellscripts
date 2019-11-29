#!/bin/bash
# Menu simples para usos diversos.



# Regular             Bold
Warning='\e[0;31m';   BWarning='\e[1;31m';
Alert='\e[0;33m';     BAlert='\e[1;33m';
Gre='\e[0;32m';       BGre='\e[1;32m';

versao=$(/usr/bin/lsb_release -ds);

clear
Menu(){
   echo -e "${BGre}"
   echo -e "----------------------------------------------------"
   echo -e "  LinuxAdmin - Meu sistema é: ${BAlert}$versao ${BGre}"
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

#Escreva as funções abaixo:
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

echo -e "${BAlert}INICIANDO SISTEMA, AGUARDE..."; sleep 3; clear; Menu
