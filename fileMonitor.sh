#!/bin/bash
###################################################################
#Script Name:   fileMonitor.sh
#Description:   Script para monitoração de criação e exclusão de arquivos em um diretorio
#Date:          06/09/2020
#Author:        @jeanrafaellourenco
#Email:         noops
#Dependency:    apt-get install -y inotify-tools
#Encode:        UTF8
#Ref:           https://unix.stackexchange.com/questions/24952/script-to-monitor-folder-for-new-files
##################################################################

function checkNewFiles() {
        inotifywait -m /home/chaves -e create -e moved_to -e delete |
                while read dir action file; do
                        # Descomente o código abaixo para ocultar a extensão do arquivo
                        # file=$(echo "$file" | cut -f 1 -d '.')
                        [ "$action" == "CREATE" ] && echo -e "Novo(s) arquivo(s) criado: '$file' no diretório '$dir' via '$action'"
                        [ "$action" == "DELETE" ] && echo -e "Arquivo(s) removido(s): '$file' no diretório '$dir' via '$action'"
                done
}

checkNewFiles
