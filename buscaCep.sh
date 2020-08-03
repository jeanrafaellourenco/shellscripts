#!/bin/bash
# Exemplo curl com jq:
# curl -sf https://viacep.com.br/ws/01001000/json/ | jq

# Resposta:
# {
# "cep": "01001-000",
# "logradouro": "Praça da Sé",
# "complemento": "lado ímpar",
# "bairro": "Sé",
# "localidade": "São Paulo",
# "uf": "SP",
# "unidade": "",
# "ibge": "3550308",
# "gia": "1004"
# }

[[ ! $(which jq 2>/dev/null) ]] && echo -e "O programa 'jq' não está instalado no momento. Você pode instalá-lo digitando: \n sudo apt install jq -y" && exit 1

CEP=$1
BUSCA=$(curl -sf https://viacep.com.br/ws/${CEP}/json/ | jq '.cep, .logradouro, .bairro, .localidade, .uf' | sed $'s/"/ /g')

[[ ! "$BUSCA" ]] && echo -e "CEP: ${CEP} inválido ou não encontrado." || echo -e "${BUSCA}"
