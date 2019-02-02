#!/bin/bash
# Veja informações sobre o clima direto do terminal

clima() {
  curl --silent "http://wttr.in/$*"
}

clima ${@}
