#!/bin/bash
# Arrays Associativos (Hash) no Bash
# Ref: https://daemoniolabs.wordpress.com/tag/array-vetor-associativo-shell-script-bash-hash/

declare -A animais
animais=( [gato]=miau [cachorro]=auau [vaca]=muu )

# Obtendo as chaves
echo ${!animais[@]}

# Obtendo os valores das chaves
echo ${animais[@]}

# outra forma de obter as chaves e os valores

# Obtendo as chaves
for chave in "${!animais[@]}"; do
  echo $chave
done

# Obtendo os valores das chaves
for valor in "${animais[@]}"; do
  echo $valor
done

# Recuperar um valor de determinada chave
echo ${animais[cachorro]}
