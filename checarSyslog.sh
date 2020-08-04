#!/bin/bash
# baseado em: https://askubuntu.com/questions/790601/accidentally-deleted-var-log-syslog
function checarSyslog() {
	if [[ -e "/var/log/syslog" ]]; then
		echo -e "$(ls -lha /var/log/syslog | awk '{ print $6,$7,$8,$5 }')"
	else
		echo -e "Arquivo de syslog não encontrado."
		sudo touch /var/log/syslog
		sudo chown syslog:adm /var/log/syslog
		sudo service rsyslog restart
		logger "Didier MISSON logger test"
		grep "Didier MISSON logger test" /var/log/syslog
	fi
}

checarSyslog
