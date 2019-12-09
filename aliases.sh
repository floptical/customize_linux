#!/bin/bash

#Custom aliases I can pass around to various systems

alias custom-aliases='vim /etc/profile.d/aliases.sh'

alias ls='grc ls -lah'
alias vi='vim'
alias vimvim='vim'
alias vivim='vim'
alias asn='whois -h whois.cymru.com " -v $1"'
alias gitkey='eval `ssh-agent`; ssh-add /root/.ssh/github'

alias password-gen1='< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;'
alias password-gen2='cat /dev/urandom | tr -dc a-zA-Z0-9 | fold -w 32 | head -n 1'
alias password-dict='shuf -n4 /usr/share/dict/american-english'
alias random-word='shuf -n4 /usr/share/dict/words'

searchFunction() {
  grep -rnw "/" -e "$1" 2>/dev/null
}


wsl=$(lscpu | grep "Hypervisor vendor" | grep -io "Windows")
if [[ "$wsl" == 'Windows' ]]; then
    alias arcpy='/mnt/c/Python27/ArcGIS10.7/python.exe'
    alias winhome='cd /mnt/c/Users/roland.macdavid'
    alias mtr='"/mnt/c/Program Files (x86)/mtr/mtr.exe"'
    alias nmap='"/mnt/c/Program Files (x86)/Nmap/nmap.exe"'
fi


docker_running=$(systemctl status docker --no-pager &>/dev/null; echo $?)
if [[ $docker_running -eq 0 ]]; then
    alias remove-docker-containers="sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm"
    alias prom-restart='docker-compose down; docker-compose up -d; sleep 2; systemctl restart dnsmasq'
    function dtail () {
      if [ "$#" -lt 1  ]; then
        >&2 echo "Usage: dtail <container_name>"
        return 1
      fi
      docker logs --tail 50 --follow --timestamps $1
    }
fi

postgres_exists=$( cat /etc/passwd | awk '{split($0,a,":"); print a[1]}' | grep postgres)
if [[ "$postgres_exists" == 'postgres' ]]; then
    alias pg-cli='sudo -u postgres psql'
    alias pg-libs='cd /usr/pgsql-11/lib/; ls -lah'
    alias pg-logs='journalctl -ru postgresql-11.service'
    alias pg-logs-follow='journalctl -fu postgresql-11.service'
fi



