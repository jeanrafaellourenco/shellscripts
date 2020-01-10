#!/bin/bash
###################################################################
#Script Name	  : setwallpaper.sh
#Description	  : Script para trocar o wallpaper segunda-feira ou quarta-feira.
#Uso            : bash setwallpaper.sh
#Date           : 09/01/2020
#Author       	: @jeanrafaellourenco
###################################################################

DATE=$(date +%w)

[ "$DATE" == "1" ] && gsettings set org.gnome.desktop.background picture-uri "file:///home/jeanrafaellourenco/Imagens/SEGUNDA.jpg" ||
	[ "$DATE" == "3" ] && gsettings set org.gnome.desktop.background picture-uri "file:///home/jeanrafaellourenco/Imagens/QUARTA.jpg" || echo "Nada acontece feijoada!"

# Outro forma de fazer a mesma coisa

# if [[ $DATE == 1 ]]; then
# 	gsettings set org.gnome.desktop.background picture-uri "file:///home/jeanrafaellourenco/Imagens/SEGUNDA.jpg"
# elif [[ $DATE == 3 ]]; then
# 	gsettings set org.gnome.desktop.background picture-uri "file:///home/jeanrafaellourenco/Imagens/QUARTA.jpg"
# else
# 	echo "Nada acontece feijoada!"
# fi
