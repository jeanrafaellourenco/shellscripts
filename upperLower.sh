#!/bin/bash
# Função para conversão de texto MAIÚSCULA/minúscula

# Conversão para maiúscula.
upper()
{
    # Lê a sequencia de caracteres da entrada padrão
    # da função e realiza a conversão a conversão dos caracteres para maiúsculo.
    tr a-z A-Z
}

# Conversão para minúscula.
lower()
{
    # Lê a sequencia de caracteres da entrada padrão
    # da função e realiza a conversão a conversão dos caracteres para minúsculo.
    tr A-Z a-z
}

read -p "Digite seu nome: " input

echo $input   |  lower
