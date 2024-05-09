# Paso 1

## Subredes
| Subred | Tamaño | Direccion   | Mask             |      | Broadcast  |
|--------|--------|-------------|------------------|------|------------|
| 1      | 64     | 10.0.1.0    | 255.255.255.192  | /26  | 10.0.1.63  |
| 2      | 64     | 10.0.1.64   | 255.255.255.192  | /26  | 10.0.1.127 |
| 3      | 256    | 10.0.0.0    | 255.255.255.0    | /24  | 10.0.0.255 |
| 4      | 512    | 10.0.2.0    | 255.255.254.0    | /23  | 10.0.3.255 |
| 5      | 64     | 10.0.1.192  | 255.255.255.192  | /26  | 10.0.1.255 |
| 6      | 32     | 10.0.1.128  | 255.255.255.224  | /27  | 10.0.1.159 |
| 7      | 16     | 10.0.1.160  | 255.255.255.240  | /28  | 10.0.1.175 |
| 8      | 4      | 10.0.1.176  | 255.255.255.252  | /30  | 10.0.1.179 |

## Direccionamiento

### PC1
| Dispositivo | Interfaz | Dirección     |
|-------------|----------|---------------|
| PC1         | ens3     | 10.0.1.4/26   |

### PC2
| Dispositivo | Interfaz | Dirección     |
|-------------|----------|---------------|
| PC2         | ens3     | 10.0.1.68/26  |

### R1
| Dispositivo | Interfaz        | Dirección       |
|-------------|-----------------|-----------------|
| R1          | ether1 (a LAN5) | 10.0.1.254/26   |
| R1          | ether2 (a LAN7) | 10.0.1.174/28   |
| R1          | ether4 (a LAN1) | 10.0.1.62/26    |

### R2
| Dispositivo | Interfaz        | Dirección       |
|-------------|-----------------|-----------------|
| R2          | ether1 (a LAN5) | 10.0.1.193/26   |
| R2          | ether4 (a LAN6) | 10.0.1.129/27   |

### R3
| Dispositivo | Interfaz        | Dirección       |
|-------------|-----------------|-----------------|
| R3          | ether1 (a LAN2) | 10.0.1.126/26   |
| R3          | ether3 (a LAN8) | 10.0.1.178/30   |
| R3          | ether4 (a LAN6) | 10.0.1.158/27   |

### R4
| Dispositivo | Interfaz        | Dirección       |
|-------------|-----------------|-----------------|
| R4          | ether1 (a LAN3) | 10.0.0.1/24     |
| R4          | ether2 (a LAN7) | 10.0.1.161/28   |
| R4          | ether3 (a LAN8) | 10.0.1.177/30   |
| R4          | ether4 (a LAN4) | 10.0.2.1/23     |

# Paso 2

## 2.2)
Debo configurar la direccion de red, la mascara, y la puerta de salida (el router conectado a cada una de ellas en este caso).

## 2.3)
Esta configuracion no es suficiente para tener conectividad entre las PCs 1 y 2, ya que no existe todavía ninguna información de ruteo cargada en los routers.

## Paso 3

## 3.1)

| Red de destino/Máscara | Próximo salto | Interfaz de salida |
|------------------------|---------------|--------------------|
| 10.0.0.0/24            | 10.0.1.177    | ether3             |
| 10.0.1.0/26            | 10.0.1.177    | ether3             |
| 10.0.1.160/28          | 10.0.1.177    | ether3             |
| 10.0.1.192/26          | 10.0.1.129    | ether4             |
| 10.0.2.0/23            | 10.0.1.177    | ether3             |

## 3.2)

```shell
ubuntu@ubuntu:~$ ping 10.0.1.162
PING 10.0.1.162 (10.0.1.162) 56(84) bytes of data.
From 10.0.1.62 icmp_seq=1 Destination Host Unreachable
From 10.0.1.62 icmp_seq=2 Destination Host Unreachable
From 10.0.1.62 icmp_seq=3 Destination Host Unreachable
```

El Router1 contesta que no pudo encontrar a nadie con la dirección de destino. Por más que sabe como llegar a la red `10.0.1.160/28`, cuando quiere entregar por entrega directa nadie le contesta su ARP, por lo que decide que el host no se puede alcanzar.

## 3.3)
Como **Router1** tiene configurado como ruta default para la red `10.0.1.64/26` al **Router4**, y **Router4** tiene configurado a Router1 como proximo salto para llegar a `10.0.1.64/26`, el mensaje echo queda loopeando entre ambos routers hasta que se termina el TTL y se triggerea el mensaje al host que avisa que el TTL expiró.

## 3.4)

Ahora, el echo request si llega a **PC1**, ya que hay una ruta de ida bien configurada, pero sigue sin llegar el _echo reply_, y a diferencia del ejercicio anterior, el mensaje de TTL expirado no llega a **PC2** porque el datagrama que expira es el _echo reply_ generado por **PC1**, osea, el mensaje de TTL expired estaría llegando a **PC1**.

## 3.5)

```shell
ubuntu@ubuntu:~$ ping 10.123.1.1
PING 10.123.1.1 (10.123.1.1) 56(84) bytes of data.
From 10.0.1.126 icmp_seq=1 Destination Net Unreachable
```

**Router2** no tiene configurado ningun proximo salto para llegar a esa red (recordar que no se configuró una ruta por defecto), por lo que genera un mensaje de error con destino a la **PC2** para avisarle que no puede llegar a esa red.

## 3.6)

Ejecutando el comando `ip route add dst-address=10.0.1.64/26 gateway=10.0.1.193` se agrega la ruta indicada (que tiene precedencia sobre la ruta por default). Ahora el ping es exitoso:

```shell
ubuntu@ubuntu:~$ ping 10.0.1.68
PING 10.0.1.68 (10.0.1.68) 56(84) bytes of data.
64 bytes from 10.0.1.68: icmp_seq=1 ttl=61 time=1.89 ms
64 bytes from 10.0.1.68: icmp_seq=2 ttl=61 time=4.08 ms
64 bytes from 10.0.1.68: icmp_seq=3 ttl=61 time=1.49 ms
64 bytes from 10.0.1.68: icmp_seq=4 ttl=61 time=3.15 ms
64 bytes from 10.0.1.68: icmp_seq=5 ttl=61 time=3.08 ms
```

# Paso 4

## 4.2)

### PC1
```shell
ubuntu@ubuntu:~$ arp -a
? (10.0.1.62) at 0c:40:ab:3f:b1:03 [ether] on ens3
```

### PC2
```shell
ubuntu@ubuntu:~$ arp -a
? (10.0.1.126) at 0c:40:ab:c8:bf:00 [ether] on ens3
```

No tienen las IPs de los respectivos hosts porque ARP lo que busca es conocer la dirección MAC de la interfaz a la que tiene que hacer entrega directa para continuar con el reenvío, y como los hosts no estan en la misma red de capa 2, cada uno de ellos almacena la MAC de su proximo salto.

## 4.3)

Para que el mensaje ICMP (_echo_) tenga una carga util de 3900 bytes (contando la carga util de todo el datagrama, que incluye también el encabezado de 8 bits del mensaje ICMP), y ademas el paquete no se fragmente, hay que ejecutar el comando `sudo ping 10.0.1.68 -c 1 -s 3892 -M dont`

El paquete fragmentado llega de la siguiente manera:

| No. | Time         | Source   | Destination | Protocol | Length | Info                                                                                      |
|-----|--------------|----------|-------------|----------|--------|-------------------------------------------------------------------------------------------|
| 563 | 1381.939996  | 10.0.1.4 | 10.0.1.68   | ICMP     | 1010   | Echo (ping) request id=0x053f, seq=1/256,<br/>ttl=61 (reply in 568)                       |
| 564 | 1381.940009  | 10.0.1.4 | 10.0.1.68   | IPv4     | 538    | Fragmented IP protocol (proto=ICMP 1, off=976, ID=558a)                                   |
| 565 | 1381.941129  | 10.0.1.4 | 10.0.1.68   | IPv4     | 1010   | Fragmented IP protocol (proto=ICMP 1, off=1480, ID=558a)                                  |
| 566 | 1381.941142  | 10.0.1.4 | 10.0.1.68   | IPv4     | 538    | Fragmented IP protocol (proto=ICMP 1, off=2456, ID=558a)                                   |
| 567 | 1381.941678  | 10.0.1.4 | 10.0.1.68   | IPv4     | 974    | Fragmented IP protocol (proto=ICMP 1, off=2960, ID=558a)                                   |

Se divide en 5 fragmentos porque antes se tuvo que fragmentar en 3 (el MTU por default es 1500). Prueba de esto esta cuando se captura del enlace entre R1 y R2:

| No. | Time      | Source   | Destination | Protocol | Length | Info                                                                                       |
|-----|-----------|----------|-------------|----------|--------|--------------------------------------------------------------------------------------------|
| 4   | 1.142845  | 10.0.1.4 | 10.0.1.68   | ICMP     | 1514   | Echo (ping) request id=0x053f, seq=1/256, ttl=63 (no response found!)                      |
| 5   | 1.144634  | 10.0.1.4 | 10.0.1.68   | IPv4     | 1514   | Fragmented IP protocol (proto=ICMP 1, off=1480, ID=558a)                                   |
| 6   | 1.145220  | 10.0.1.4 | 10.0.1.68   | IPv4     | 974    | Fragmented IP protocol (proto=ICMP 1, off=2960, ID=558a)                                   |

# Paso 5
## 5.2)

```
[admin@Router02] > ip address print
Flags: X - disabled, I - invalid, D - dynamic
 #   ADDRESS            NETWORK         INTERFACE
 0   10.10.0.1/24       10.10.0.0       ether2
 1   10.0.1.193/26      10.0.1.192      ether1
 2   10.0.1.129/27      10.0.1.128      ether4
```

Puede apreciarse como la dirección IP asignada para la **LAN0** que usa **Router2** es `10.10.0.1`, y que la mascara de red es `255.255.255.0`.

## 5.5)

Para configurar una dirección de loopback, han de usarse los comandos:

```
> interface bridge add name=loopback
> ip address add address=<dir-de-loopback> interface=loopback
```

## 5.6)
Para levantar la instancia de OSPF en cada uno de los routers, usando como router-id la dirección de loopback configurada anteriormente, se ejecuta el comando:

```
> routing ospf instance set 0 router-id=<dir-de-loopback>
```

## 5.7)

Para publicar las redes en OSPF, en cada router se ejecuto el siguiente comando tantas veces como redes a las que esten conectados:

```
> routing ospf network add network=<red>/<mask> area=backbone
```

En este caso el unico area considerada es el backbone o area 0.

## 5.8)

Considero que se llegó a la convergencia porque al revisar la tabla de reenvío de cada router, cada una tiene una entrada para cada una de las 10 LANs de la topología. Aclarar que para que se simulen correctamente las LANs 3 y 4 tuvieron que agregarse hosts adicionales, porque de lo contrario las interfaces del Router4 correspondientes a esas LANs se mostraban como apagadas y no se compartia información sobre como llegar a las redes mediante el protocolo OSPF.
