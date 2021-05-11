#!/bin/bash
###################################################################
# Script Name: gerador-lero-lero-ti.sh
# Description: Gerador de lero lero da linha de comando
# Date: 10/05/2021
# Author: @jeanrafaellourenco
# Encode: UTF8
# Ref: http://lerolero.bgnweb.com.br/leroleroti.html
###############################################################

tab0=("Considerando que temos bons administradores de rede "
    "Por outro lado "
    "Assim mesmo "
    "No entanto não podemos esquecer que "
    "Do mesmo modo "
    "A implantação na prática  prova que "
    "Nunca é demais lembrar o impacto destas possíveis vulnerabilidades uma vez que "
    "As experiências acumuladas demonstram que "
    "Acima de tudo é fundamental ressaltar que "
    "O incentivo ao avanço tecnológico assim como "
    "Não obstante "
    "Todas estas questões devidamente ponderadas levantam dúvidas sobre se "
    "Pensando mais a longo prazo "
    "O que temos que ter sempre em mente é que "
    "Ainda assim existem dúvidas a respeito de como "
    "Enfatiza-se que "
    "Todavia "
    "No nível organizacional "
    "O empenho em analisar "
    "Percebemos cada vez mais que "
    "No mundo atual "
    "É importante questionar o quanto "
    "Neste sentido "
    "Evidentemente "
    "Por conseguinte "
    "É claro que "
    "Podemos já vislumbrar o modo pelo qual "
    "Desta maneira "
    "O cuidado em identificar pontos críticos n"
    "A certificação de metodologias que nos auxiliam a lidar com ")

tab1=("a implementação do código "
    "a complexidade computacional "
    "a lógica proposicional "
    "a lei de Moore "
    "o novo modelo computacional aqui preconizado "
    "o desenvolvimento contínuo de distintas formas de codificação "
    "a constante divulgação das informações "
    "a consolidação das infraestruturas "
    "a consulta aos diversos sistemas "
    "a preocupação com a TI verde "
    "a interoperabilidade de hardware "
    "a disponibilização de ambientes "
    "o aumento significativo da velocidade dos links de Internet "
    "a criticidade dos dados em questão "
    "o desenvolvimento de novas tecnologias de virtualização "
    "a alta necessidade de integridade "
    "o crescente aumento da densidade de bytes das mídias "
    "a necessidade de cumprimento dos SLAs previamente acordados "
    "a utilização de SSL nas transações comerciais "
    "a utilização de recursos de hardware dedicados "
    "a revolução que trouxe o software livre "
    "o índice de utilização do sistema "
    "o comprometimento entre as equipes de implantação "
    "a determinação clara de objetivos "
    "a adoção de políticas de segurança da informação "
    "a valorização de fatores subjetivos "
    "a percepção das dificuldades "
    "o entendimento dos fluxos de processamento "
    "o consenso sobre a utilização da orientação a objeto "
    "o uso de servidores em datacenter ")

tab2=("nos obriga à migração "
    "cumpre um papel essencial na implantação "
    "exige o upgrade e a atualização "
    "auxilia no aumento da segurança e/ou na mitigação dos problemas "
    "garante a integridade dos dados envolvidos "
    "assume importantes níveis de uptime "
    "facilita a criação "
    "inviabiliza a implantação "
    "oferece uma interessante oportunidade para verificação "
    "acarreta um processo de reformulação e modernização "
    "pode nos levar a considerar a reestruturação "
    "representa uma abertura para a melhoria "
    "ainda não demonstrou convincentemente que está estável o suficiente "
    "talvez venha causar instabilidade "
    "imponha um obstáculo ao upgrade para novas versões "
    "minimiza o gasto de energia "
    "conduz a um melhor balancemanto de carga "
    "agrega valor ao serviço prestado "
    "é um ativo de TI "
    "implica na melhor utilização dos links de dados "
    "não pode mais se dissociar "
    "possibilita uma melhor disponibilidade "
    "causa uma diminuição do throughput "
    "otimiza o uso dos processadores "
    "faz parte de um processo de gerenciamento de memória avançado "
    "causa impacto indireto no tempo médio de acesso "
    "apresenta tendências no sentido de aprovar a nova topologia "
    "estende a funcionalidade da aplicação "
    "deve passar por alterações no escopo "
    "afeta positivamente o correto provisionamento ")

tab3=("dos requisitos mínimos de hardware exigidos."
    "dos paradigmas de desenvolvimento de software."
    "do sistema de monitoramento corporativo."
    "das novas tendencias em TI."
    "dos equipamentos pré-especificados."
    "das direções preferenciais na escolha de algorítimos."
    "do bloqueio de portas imposto pelas redes corporativas."
    "das janelas de tempo disponíveis."
    "dos índices pretendidos."
    "das formas de ação."
    "dos paralelismos em potencial."
    "da rede privada."
    "das ferramentas OpenSource."
    "dos métodos utilizados para localização e correção dos erros."
    "de todos os recursos funcionais envolvidos."
    "da utilização dos serviços nas nuvens."
    "da gestão de risco."
    "da terceirização dos serviços."
    "de alternativas aos aplicativos convencionais."
    "dos procedimentos normalmente adotados."
    "da garantia da disponibilidade."
    "do fluxo de informações."
    "do levantamento das variáveis envolvidas."
    "da autenticidade das informações."
    "do impacto de uma parada total."
    "das ACLs de segurança impostas pelo firewall."
    "da confidencialidade imposta pelo sistema de senhas."
    "do tempo de down-time que deve ser mínimo."
    "dos procolos comumente utilizados em redes legadas."
    "dos problemas de segurança escondidos que existem nos sistemas operacionais proprietários.")

function lerolero() {
    sorte0=$(($RANDOM%30))
    sorte1=$(($RANDOM%30))
    sorte2=$(($RANDOM%30))
    sorte3=$(($RANDOM%30))
    mensagem=$(echo -e  "${tab0[$sorte0]}${tab1[$sorte1]}${tab2[$sorte2]}${tab3[$sorte3]}")
    # debug
    # echo -e  "$sorte0 $sorte1 $sorte2 $sorte3"
    echo $mensagem
}

# gera 5 parágrafos de lorota.
for i in {1..5}; do
    lerolero
done
