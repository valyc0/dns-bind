#!/bin/bash

# Configurazioni
DNS_SERVER="172.16.238.10"
ZONE="esempio.com"
HOSTNAME="client1.esempio.com"
# IP="172.16.238.11"
IP="$(hostname -I | awk '{print $1}')"
KEY_FILE="/scripts/ddns-key"

# Esegui nsupdate
nsupdate -k "$KEY_FILE" -d <<EOF
server $DNS_SERVER
zone $ZONE
update delete $HOSTNAME A
update add $HOSTNAME 86400 A $IP
send
EOF

if [ $? -eq 0 ]; then
    echo "DNS record updated: $HOSTNAME -> $IP"
else
    echo "Failed to update DNS record."
fi