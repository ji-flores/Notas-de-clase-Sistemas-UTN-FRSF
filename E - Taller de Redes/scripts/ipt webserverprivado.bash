#!/bin/bash

# Declaracion de variables
redVPN="192.168.0.0/23"
redAWS="10.0.0.0/16"
anywhere="0.0.0.0/0"
conexionEstablished="state --state ESTABLISHED"
conexionAny="state --state ESTABLISHED,NEW"
echoRequest="--icmp-type 8"
echoReply="--icmp-type 0"
proxyReverso="10.0.1.93"


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
iptables -A INPUT -i enX0 -s $redVPN -p tcp --dport 22 -m $conexionAny -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redVPN -p tcp --sport 22 -m $conexionEstablished -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redVPN -p tcp --dport 22 -m $conexionAny -j ACCEPT
iptables -A INPUT -i enX0 -s $redVPN -p tcp --sport 22 -m $conexionEstablished -j ACCEPT
iptables -A INPUT -i enX0 -s $redAWS -p tcp --dport 22 -m $conexionAny -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redAWS -p tcp --sport 22 -m $conexionEstablished -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redAWS -p tcp --dport 22 -m $conexionAny -j ACCEPT
iptables -A INPUT -i enX0 -s $redAWS -p tcp --sport 22 -m $conexionEstablished -j ACCEPT

# Echo con cualquier dispositivo de la VPN (ver si tambien red interna)
iptables -A INPUT -i enX0 -s $redVPN -p icmp $echoRequest -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redVPN -p icmp $echoReply -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redVPN -p icmp $echoRequest -j ACCEPT
iptables -A INPUT -i enX0 -s $redVPN -p icmp $echoReply -j ACCEPT
iptables -A INPUT -i enX0 -s $redAWS -p icmp $echoRequest -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redAWS -p icmp $echoReply -j ACCEPT
iptables -A OUTPUT -o enX0 -d $redAWS -p icmp $echoRequest -j ACCEPT
iptables -A INPUT -i enX0 -s $redAWS -p icmp $echoReply -j ACCEPT

# Habilitar acceso a internet (http/https/dns/ftp)
# http
iptables -A OUTPUT -o enX0 -d $anywhere -p tcp --dport 80 -m $conexionAny -j ACCEPT
iptables -A INPUT -i enX0 -s $anywhere -p tcp --sport 80 -m $conexionEstablished -j ACCEPT
# https
iptables -A OUTPUT -o enX0 -d $anywhere -p tcp --dport 443 -m $conexionAny -j ACCEPT
iptables -A INPUT -i enX0 -s $anywhere -p tcp --sport 443 -m $conexionEstablished -j ACCEPT
# dns
iptables -A OUTPUT -o enX0 -d $anywhere -p udp --dport 53 -j ACCEPT
iptables -A INPUT -i enX0 -s $anywhere -p udp --sport 53 -j ACCEPT
iptables -A OUTPUT -o enX0 -d $anywhere -p tcp --dport 53 -m $conexionAny -j ACCEPT
iptables -A INPUT -i enX0 -s $anywhere -p tcp --sport 53 -m $conexionEstablished -j ACCEPT
# ftp
iptables -A OUTPUT -o enX0 -d $anywhere -p tcp --dport 20:21 -j ACCEPT
iptables -A INPUT -i enX0 -s $anywhere -p tcp --sport 20:21 -j ACCEPT

# Aceptar conexiones HTTP (Servidor Web)
iptables -A INPUT -i enX0 -s $proxyReverso -p tcp --dport 80 -m $conexionAny -j ACCEPT
iptables -A OUTPUT -o enX0 -d $proxyReverso -p tcp --sport 80 -m $conexionEstablished -j ACCEPT