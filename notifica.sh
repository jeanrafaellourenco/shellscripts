#!/bin/bash
# script para notificação no desktop.
# Ref: http://www.dicas-l.com.br/arquivo/notify-send_notificacoes_no_desktop.php#.W5GDpRhv9D-
###################################################################

# Utilizo esta notificação em outros scripts para avisar o fim de uma tarefa como um backup por exemplo
# ou fim de uma tarefa.
# -i=icone -t=tempo da notificação
# Ex: notify-send -i face-monkey -t 100000 "Fim da tarefa"  "Acabamos de executar uma tarefa"

notify-send -i face-monkey -t 100000 "Titulo"  "Mensagem"
