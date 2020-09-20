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
[[ ! $(which inotifywait 2>/dev/null) ]] && echo -e "O programa 'inotifywait' não está instalado no momento. Você pode instalá-lo digitando: \nsudo apt install inotify-tools -y" && exit 1

function checkNewFiles() {
        # remova o parâmetro -r para deixar de monitorar recursivamente
        inotifywait -m -e create -e moved_to -e delete -e modify . |
                while read dir action file; do
                        # Descomente o código abaixo para ocultar a extensão do arquivo
                        # file=$(echo "$file" | cut -f 1 -d '.')
                        [ "$action" == "CREATE" ] && echo -e "Novo(s) arquivo(s) criado: '$file' no diretório '$dir' via '$action'"
                        [ "$action" == "MODIFY" ] && echo -e "Arquivo(s) modificado(s): '$file' no diretório '$dir' via '$action'"
                        [ "$action" == "DELETE" ] && echo -e "Arquivo(s) removido(s): '$file' no diretório '$dir' via '$action'"
                done
}

checkNewFiles
