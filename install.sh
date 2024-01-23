#!/bin/bash

install_on(){
    cp git-split.sh $1
    chmod +x $1
    if [[ `echo $?` == '0' ]]; then
        echo "[+] git-split installed successfully"
    else
        echo "[+] git-split installation failed"
    fi
}

main() {
    echo $PATH | grep $USER/.local/bin 2>&1 > /dev/null
    if [[ `echo $?` == '0' ]]; then
        install_on ~/.local/bin/git-split
    else
        install_on /usr/bin/git-split
    fi
}

main
