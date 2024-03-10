#!/bin/bash
#######################################################################
# Nome do Script: openvpn3-client.sh
# Descrição: script para conexão VPN na nuvem usando openvpn3
# Autor: https://github.com/jeanrafaellourenco
# Data: 14/06/2021
# Dependências: apt-transport-https, openvpn3
# Codificação: UTF8
# Ref: https://openvpn.net/cloud-docs/openvpn-3-client-for-linux/
#######################################################################

_ajuda() {
	cat <<EOF
Uso: ${0##*/} [opção]
Opções:
    --instalar		- Se esta for a primeira utilização deste script
    --conectar   	- Para conectar à VPN
    --status		- Verificar se está conectado à VPN
    --estatisticas	- Obter estatísticas do túnel para túneis já em execução
    --desconectar 	- Para desconectar da VPN
[*] Não execute com 'sudo' ou como 'root'.
[**] Use este script apenas em sistemas baseados em APT.
EOF
	exit 0
}

[[ $(id -u) -eq 0 ]] && _ajuda | tail -n 2 | sed -n 1p && exit 1
[[ -z "$1" ]] && _ajuda
[[ ! $(which apt) ]] && _ajuda | tail -n 1 && exit 1

function instalar() {
	[[ ! $(find ~/*.ovpn 2>/dev/null) ]] && echo -e "Nenhum arquivo *.ovpn encontrado em: $HOME" && exit 1 # verifica se há um arquivo .ovpn no diretório home do usuário.
	[[ $(which openvpn3) ]] && echo -e "Programa 'openvpn3' já está instalado!\n" && _ajuda

	DISTRO=$(/usr/bin/lsb_release -c | awk '{ print $2 }') # Nome da versão
	[[ $DISTRO == "una" ]] && DISTRO="focal" || [[ $DISTRO == "vera" ]] && DISTRO="jammy" # para versões do Linux Mint 20 e 22
	sudo apt update && sudo apt install apt-transport-https -y
	wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub
	sudo apt-key add openvpn-repo-pkg-key.pub
	sudo wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list
	sudo apt update
	sudo apt install openvpn3 -y
	# importa um arquivo .ovpn do diretório home do usuário.
	[[ ! $(find ~/*.ovpn 2>/dev/null) ]] && echo -e "Nenhum arquivo *.ovpn encontrado em: $HOME" && exit 1 || openvpn3 config-import --persistent --config ~/*.ovpn
}

function status() {
	openvpn3 sessions-list
}

function conectar() {
	SESSION=$(openvpn3 sessions-list | grep "/net/openvpn/v3/sessions/" | awk '{ print $2 }')
	[[ -n $SESSION ]] && echo -e "Já existe uma conexão aberta, tente desconectar primeiro.\n" && _ajuda
	echo -e "Aguarde a conexão..."
	openvpn3 session-start -p $(openvpn3 configs-list | grep "/net/openvpn/v3/configuration/")
}

function estatisticas() {
	SESSION=$(openvpn3 sessions-list | grep "/net/openvpn/v3/sessions/" | awk '{ print $2 }')
	[[ -z $SESSION ]] && echo -e "Nenhuma sessão disponível.\n" && _ajuda
	openvpn3 session-stats --path $SESSION
}

function desconectar() {
	SESSION=$(openvpn3 sessions-list | grep "/net/openvpn/v3/sessions/" | awk '{ print $2 }')
	[[ -z $SESSION ]] && echo -e "Nenhuma sessão disponível.\n" && _ajuda
	echo -e "Aguarde para desconectar..."
	openvpn3 session-manage --path $SESSION --disconnect
	sleep 5
	echo -e "\nDesconectado!"
	status
}

while [[ "$1" ]]; do
	case "$1" in
	--instalar) instalar ;;
	--conectar) conectar ;;
	--status) status ;;
	--estatisticas) estatisticas ;;
	--desconectar) desconectar ;;
	*) echo -e "Opção inválida\n" && _ajuda ;;
	esac
	shift
done
