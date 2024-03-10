#!/bin/bash
###################################################################
# Nome do Script:   monitor_arquivos.sh
# Descrição:        Script para monitoração de criação e exclusão de arquivos em um diretório
# Autor:            https://github.com/jeanrafaellourenco
# Data:             06/09/2020
# Dependência:      apt-get install -y inotify-tools
# Codificação:      UTF8
# Ref:              https://unix.stackexchange.com/questions/24952/script-to-monitor-folder-for-new-files
###################################################################

# Verifica se o programa 'inotifywait' está instalado
if ! command -v inotifywait >/dev/null 2>&1; then
    echo -e "O programa 'inotifywait' não está instalado no momento. Você pode instalá-lo digitando: \nsudo apt install inotify-tools -y"
    exit 1
fi

function checarNovosArquivos() {
    # Monitora o diretório atual (-m) e seus subdiretórios (-r)
    # Observa eventos de criação (-e create), movimentação (-e moved_to), exclusão (-e delete) e modificação (-e modify)
    inotifywait -m -r -e create -e moved_to -e delete -e modify $(pwd) |
        while read dir action file; do
            # Descomente o código abaixo para ocultar a extensão do arquivo
            # file=$(echo "$file" | cut -f 1 -d '.')
            case "$action" in
                CREATE)
                    notify-send -i terminal -t 100000 "Backups" "Novo(s) arquivo(s) criado: '$file' no diretório '$dir'"
                    ;;
                MODIFY)
                    notify-send -i terminal -t 100000 "Backups" "Arquivo(s) modificado(s): '$file' no diretório '$dir'"
                    ;;
                DELETE)
                    notify-send -i terminal -t 100000 "Backups" "Arquivo(s) removido(s): '$file' no diretório '$dir'"
                    ;;
            esac
        done
}

checarNovosArquivos
