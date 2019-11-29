#!/bin/bash
# --------------------------------------
# ./teste.sh
# Pesquisa arquivos ou diretorios e suas permissões 
# Uso: ./teste.sh [DIRETORIO] ou ./teste.sh [ARQUIVO]
# Exemplo.: ./teste.sh ~/Downloads ou ./teste.sh ~/Downloads/teste.sh
# Autor: https://www.nixcraft.com/t/test-command-line-argument-to-check-for-directory-file-and-permission-on-bash/806
# Adaptado por: @jeanrafaellourenco
# --------------------------------------

# dof = dir or file =)
dof="$1"

[ "$dof" == "" ] && { echo -e "\nArquivo ou diretório não informado, use ex: ./teste.sh $HOME"; exit 1; }

echo
echo "Arquivo ou diretório \"$dof\" tem a seguinte permissão para o usuário \"$USER\":"
echo

# Descubra se é um diretório ou não
[ -d "$dof" ] && echo "Diretório: sim" || echo "Diretório: não"

# Descubra se um arquivo ou não
[ -f "$dof" ] && echo "Arquivo: sim" || echo "Arquivo: não"

# Descubra se um arquivo tem permissão de leitura ou não
[ -r "$dof" ] && echo "Permissão de leitura: sim" || echo  "Permissão de leitura: não"

# Descubra se um arquivo tem permissão de gravação ou não
[ -w "$dof" ] && echo "Permissão de escrita: sim" || echo  "Permissão de escrita: não"

# Descubra se um arquivo tem uma permissão de execução ou não 
[ -x "$dof" ] && echo "Permissão de execução: sim" || echo "Permissão de execução: não"
