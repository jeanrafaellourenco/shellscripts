#!/bin/bash

[[ ! $(which jq 2>/dev/null) ]] && echo -e "O programa 'jq' não está instalado no momento. Você pode instalá-lo digitando: \n sudo apt install jq -y" && exit 1

CEP=$1
BUSCA=$(curl -sf "https://buscacepinter.correios.com.br/app/endereco/carrega-cep-endereco.php?pagina=%2Fapp%2Fendereco%2Findex.php&cepaux=&mensagem_alerta=&endereco=${CEP}&tipoCEP=ALL"  | jq)

[[ ! "$BUSCA" ]] && echo -e "CEP: ${CEP} inválido ou não encontrado." || echo -e "${BUSCA}"
