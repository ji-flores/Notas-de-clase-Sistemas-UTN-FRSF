#!/bin/bash

# Declaracion de variables
anywhere="0.0.0.0/0"
redAWS="10.0.0.0/16"
redVPN="192.168.0.0/23"
redWebPrivado="10.0.1.0/24"
redBD="10.0.2.0/24"
proxyServer="10.0.1.93"
centralTelefonica="10.0.1.93"
myIP="10.0.0.214"
conexionEstablished="state --state ESTABLISHED,NEW"
conexionAny="state --state ESTABLISHED,NEW"
echoRequest="--icmp-type 8"
echoReply="--icmp-type 0"

# Flushear estado previo
iptables -F
iptables -t nat -F

# Politica por defecto: DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

## FILTER

# Habilitar interfaz de loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# SSH con cualquier dispositivo de la VPN (ver si tambien red interna)
iptables -A INPUT -i tr0 -s $redVPN -p tcp --dport 22 -m $conexionAny -j ACCEPT
iptables -A OUTPUT -o tr0 -d $redVPN -p tcp --sport 22 -m $conexionEstablished -j ACCEPT
iptables -A OUTPUT -o tr0 -d $redVPN -p tcp --dport 22 -m $conexionAny -j ACCEPT
iptables -A INPUT -i tr0 -s $redVPN -p tcp --sport 22 -m $conexionEstablished -j ACCEPT
iptables -A INPUT -i enX0 -s $redAWS -p tcp --dport 22 -m $conexionAny -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redAWS -p tcp --sport 22 -m $conexionEstablished -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redAWS -p tcp --dport 22 -m $conexionAny -j ACCEPT
iptables -A INPUT -i enX0 -s $redAWS -p tcp --sport 22 -m $conexionEstablished -j ACCEPT

# Echo con cualquier dispositivo de la VPN (ver si tambien red interna)
iptables -A INPUT -i tr0 -s $redVPN -p icmp $echoRequest -j ACCEPT
iptables -A OUTPUT -o tr0 -d $redVPN -p icmp $echoReply -j ACCEPT
iptables -A OUTPUT -o tr0 -d $redVPN -p icmp $echoRequest -j ACCEPT
iptables -A INPUT -i tr0 -s $redVPN -p icmp $echoReply -j ACCEPT
iptables -A INPUT -i enX0 -s $redAWS -p icmp $echoRequest -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redAWS -p icmp $echoReply -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redAWS -p icmp $echoRequest -j ACCEPT
iptables -A INPUT -i enX0 -s $redAWS -p icmp $echoReply -j ACCEPT

# Habilitar acceso a internet (http/https/dns/ftp)
# (Habilitar http tambien permite que actue de intermediario entre los usuarios y los backend Web)
# http
iptables -A OUTPUT -o enX0 -d $anywhere -p tcp --dport 80 -m $conexionAny -j ACCEPT
iptables -A INPUT -i enX0 -s $anywhere -p tcp --sport 80 -m $conexionEstablished -j ACCEPT
# https
iptables -A OUTPUT -o enX0 -d $anywhere -p tcp --dport 443 -m $conexionAny -j ACCEPT
iptables -A INPUT -i enX0 -s $anywhere -p tcp --sport 443 -m $conexionEstablished -j ACCEPT
# dns
iptables -A OUTPUT -o enX0 -d $anywhere -p udp --dport 53 -j ACCEPT
iptables -A INPUT -i enX0 -s $anywhere -p udp --sport 53 -j ACCEPT
iptables -A OUTPUT -o enX0 -d $anywhere -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -i enX0 -s $anywhere -p tcp --sport 53 -j ACCEPT
# ftp
iptables -A OUTPUT -o enX0 -d $anywhere -p tcp --dport 20:21 -j ACCEPT
iptables -A INPUT -i enX0 -s $anywhere -p tcp --sport 20:21 -j ACCEPT

# Habilitar VPN Wireguard (TODO: Ver si hay que habilitar IPs virtuales)
iptables -A INPUT -i enX0 -s $anywhere -p udp --dport 51820 -j ACCEPT
iptables -A OUTPUT -o enX0 -d $anywhere -p udp --sport 51820 -j ACCEPT

# Habilitar Proxy Squid (permite instancias de la red interna o VPN)
iptables -A INPUT -i enX0 -s $redAWS -p tcp --dport 3128 -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redAWS -p tcp --sport 3128 -j ACCEPT
iptables -A INPUT -i tr0 -s $redVPN -p tcp --dport 3128 -j ACCEPT
iptables -A OUTPUT -o tr0 -d $redVPN -p tcp --sport 3128 -j ACCEPT

# Habilitar forwarding de SSH
iptables -A FORWARD -i tr0 -s $redVPN -p tcp --dport 22 -m $conexionAny -j ACCEPT
iptables -A FORWARD -o tr0 -d $redVPN -p tcp --sport 22 -m $conexionEstablished -j ACCEPT

# Habilitar forwarding de RDP
iptables -A FORWARD -i tr0 -s $redVPN -p tcp --dport 3389 -m $conexionAny -j ACCEPT
iptables -A FORWARD -o tr0 -d $redVPN -p tcp --sport 3389 -m $conexionEstablished -j ACCEPT

# Habilitar forwarding de Echo
iptables -A FORWARD -i tr0 -s $redVPN -p icmp $echoRequest -j ACCEPT
iptables -A FORWARD -o tr0 -d $redVPN -p icmp $echoReply -j ACCEPT
iptables -A FORWARD -o tr0 -d $redVPN -p icmp $echoRequest -j ACCEPT
iptables -A FORWARD -i tr0 -s $redVPN -p icmp $echoReply -j ACCEPT

# Habilitar forwarding de http/https (Servidor WEB privado)
iptables -A FORWARD -i tr0 -s $redVPN -d $proxyServer -p tcp --dport 80 -m $conexionAny -j ACCEPT
iptables -A FORWARD -o tr0 -d $redVPN -s $proxyServer -p tcp --sport 80 -m $conexionEstablished -j ACCEPT
iptables -A FORWARD -i tr0 -s $redVPN -d $proxyServer -p tcp --dport 443 -m $conexionAny -j ACCEPT
iptables -A FORWARD -o tr0 -d $redVPN -s $proxyServer -p tcp --sport 443 -m $conexionEstablished -j ACCEPT

# Habilitar forwarding de VoIP (Asterisk)
iptables -A FORWARD -i tr0 -s $redVPN -d $centralTelefonica -p udp --dport 5060 -j ACCEPT
iptables -A FORWARD -o tr0 -d $redVPN -s $centralTelefonica -p udp --sport 5060 -j ACCEPT
iptables -A FORWARD -i tr0 -s $redVPN -d $centralTelefonica -p udp --dport 10000:20000 -j ACCEPT
iptables -A FORWARD -o tr0 -d $redVPN -s $centralTelefonica -p udp --sport 10000:20000 -j ACCEPT
iptables -A FORWARD -s $redVPN -d $redVPN -j ACCEPT #????

# Habilitar forwarding de servicios necesarios para internet
# Las redes que no tienen una regla es porque:
#	- No deben salir a internet libremente (red USUARIOS)
#	- Salen por otro access point (red PUBLICA y WEB SERVER PUBLICO)

# Red BASE DE DATOS
# http
iptables -A FORWARD -i enX0 -s $redBD -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -o enX0 -d $redBD -p tcp --sport 80 -j ACCEPT
# https
iptables -A FORWARD -i enX0 -s $redBD -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -o enX0 -d $redBD -p tcp --sport 443 -j ACCEPT
#dns
iptables -A FORWARD -i enX0 -s $redBD -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -o enX0 -d $redBD -p tcp --sport 53 -j ACCEPT
#ftp
iptables -A FORWARD -i enX0 -s $redBD -p tcp --dport 20:21 -j ACCEPT
iptables -A FORWARD -o enX0 -d $redBD -p tcp --sport 20:21 -j ACCEPT

# Red WEB SERVER PRIVADO
# http
iptables -A FORWARD -i enX0 -s $redWebPrivado -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -o enX0 -d $redWebPrivado -p tcp --sport 80 -j ACCEPT
# https
iptables -A FORWARD -i enX0 -s $redWebPrivado -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -o enX0 -d $redWebPrivado -p tcp --sport 443 -j ACCEPT
#dns
iptables -A FORWARD -i enX0 -s $redWebPrivado -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -o enX0 -d $redWebPrivado -p tcp --sport 53 -j ACCEPT
#ftp
iptables -A FORWARD -i enX0 -s $redWebPrivado -p tcp --dport 20:21 -j ACCEPT
iptables -A FORWARD -o enX0 -d $redWebPrivado -p tcp --sport 20:21 -j ACCEPT

# NAT
iptables -t nat -A POSTROUTING -o enX0 -s $redBD -j MASQUERADE
iptables -t nat -A POSTROUTING -o enX0 -s $redWebPrivado -j MASQUERADE