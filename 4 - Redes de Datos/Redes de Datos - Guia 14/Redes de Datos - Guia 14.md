# Guia 14.1

## Paso 1

La politica por defecto de `INPUT` es `DROP`, y las de `OUTPUT` y `FORWARD` es `ACCEPT`.

```shell
Chain INPUT (policy DROP 0 packets, 0 bytes)

(...)

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)

(...)

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)

(...)

```

## Paso 2

1. Usando el navegador Mozilla para navegar a 10.1.1.2, se muestra exitosamente un resultado. Esto se debe a que Host-2 acepta conexiones al puerto 80 (http), y también acepta por defecto mensajes salientes.
2. En cambio, cuando realizo envió un echo request usando ping, el firewall descarta el mensaje ICMP porque las reglas especifican que solo pueden recibirse mensajes echo reply. Y por esa ultima razón, si funcionan los pings desde Host-2 a Host-1.

## Paso 3

```shell
Chain INPUT (policy DROP 10 packets, 600 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       tcp  --  *      *       10.1.1.0/27          10.1.1.2             tcp dpt:80
    0     0 ACCEPT     tcp  --  *      *       10.1.1.0/27          10.1.1.2             tcp dpt:80

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 10 packets, 600 bytes)
 pkts bytes target     prot opt in     out     source               destination
```

La conexión http no funciona porque antes de la regla que acepta la llegada de mensajes TCP al puerto 80, hay una casi identica, pero que en su lugar los DROPea.

Los pings no funcionan en nignuno de los dos sentidos porque aplica la politica por defecto que es de DROP.

La diferencia con las reglas en el script `reglas3.sh`, es que esta vez, la regla ACCEPT esta primero, por lo que la conexión http debería ser exitosa. En efecto lo es. El ping sigue sin funcionar por supuesto.

Ahora, las reglas aplicadas con reglas4.sh:

```shell
Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     icmp --  lo     *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      *       10.1.1.2             10.1.1.1             tcp spt:80

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
```

Los pings todavía no estan permitidos porque lo que se permitió fue la entrada libre de mensajes ICMP, pero a la interfaz de loopback.

Si se modifica el script añadiendo las siguientes lineas:

```shell
iptables -A INPUT -i ens3 -s 10.1.1.1 -d 10.1.1.2 -p icmp --icmp-type 0 -j ACCEPT
iptables -A INPUT -i ens3 -s 10.1.1.1 -d 10.1.1.2 -p icmp --icmp-type 8 -j ACCEPT
```

Con la adición de esas reglas, ahora es posible el intercambio de ping, porque existen dos reglas que explicitamente admiten mensajes echo reply y request provenientes del Host-1, y la politica de OUTPUT es ACCEPT por default.

Ahora, para permitir la conexion al servidor web:

```shell
iptables -A INPUT -i ens3 -s 10.1.1.1 -d 10.1.1.2 -p tcp --sport 1024:65535 --dport 80 -m state --state ESTABLISHED,NEW -j ACCEPT
```

El script en su estado anterior aceptaba que mensajes con su IP y con destino en Host-1, y desde el puerto 80, lleguen a cualquier interfaz (lo cual es raro).

# Guia 14.2

## Paso 2

#### 1)
Se acepta solo el trafico de salida y de forwarding, es así por politica de filtrado.

#### 5)
Primero el sitio cargó, y luego no. Esto es porque se cambio la politica de la cadena INPUT (de ACCEPT a DROP).

#### 7)
Se agregaron las sentencias

```shell
# Script realizado por el usuario
iptables -A INPUT -i ens3 -s 10.1.1.1 -d 10.1.1.2 -p icmp --icmp-type 8 -j ACCE$
iptables -A OUTPUT -o ens3 -s 10.1.1.2 -d 10.1.1.1 -p icmp --icmp-type 0 -j ACC$

# Politica por defecto
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
```

#### 9)

```shell
# Script realizado por el usuario
iptables -A INPUT -i ens3 -s 10.1.1.1 -d 10.1.1.2 -p icmp --icmp-type 8 -j ACCEPT
iptables -A OUTPUT -o ens3 -s 10.1.1.2 -d 10.1.1.1 -p icmp --icmp-type 0 -j ACCEPT
iptables -A INPUT -i ens3 -s 10.1.1.0/27 -d 10.1.1.2 -p tcp --sport 1024:65535 -m multiport --dports 80,443 -j ACCEPT
iptables -A OUTPUT -o ens3 -s 10.1.1.2 -d 10.1.1.0/27 -p tcp --dport 1024:65535 -m multiport --sports 80,43 -m state --state ESTABLISHED -j ACCEPT

# Politica por defecto
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

```

# Guia 14.3

## Relevamiento

| Host        | IP/Mask     | GW            |
| ----------- | ----------- | ------------- |
| PC1-Cliente | 10.1.1.1/24 | 10.1.1.3      |
| PC2-Server  | 10.1.1.2/24 | 10.1.1.3      |
| PC3-Proxy   | 10.1.1.3/24 | 192.168.122.1 |
| PC4-Host    | 10.1.1.4/24 | 10.1.1.3      |

En todos los equipos, todas las cadenas de iptables estan vacias, con politica por default ACCEPT.

