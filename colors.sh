function action() {
    prompt="$1"
    echo -e -n "\033[1;32m$prompt"
    echo -e -n '\033[0m'
    read
}

function alert() {
    prompt="$1"
    echo -e -n "\033[1;33m$prompt"
    echo -e -n '\033[0m'
    read
}

function danger() {
    prompt="$1"
    echo -e -n "\033[1;31m$prompt"
    echo -e -n '\033[0m'
    read
}
action "\nPress enter to continue..."
alert "\nPress enter to continue..."
danger "\nPress enter to continue..."
