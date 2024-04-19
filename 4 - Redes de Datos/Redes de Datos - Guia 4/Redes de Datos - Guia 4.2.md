Redes de Datos - Guia 4.2 (Laboratorio de Reenvío Básico)
======

# Paso 1

|Red  |Tamaño de subred|Direccion de Red|Mascara        |Broadcast    |
|-----|----------------|----------------|---------------|-------------|
|**Red_A**|128             |192.168.0.0     |255.255.255.128|192.168.0.127|
|**Red_1**|4               |192.168.0.128   |255.255.255.252|192.168.0.131|
|**Red_B**|64              |192.168.0.192   |255.255.255.192|192.168.0.255|

|Dispositivo|Interfaz|Direccion IP |Mascara        |
|-----------|--------|-------------|---------------|
|**PC1**        |e0      |192.168.0.1  |255.255.255.128|
|**Router1**    |ether3  |192.168.0.126|255.255.255.128|
|**Router1**    |ether2  |192.168.0.129|255.255.255.252|
|**Router2**    |ether2  |192.168.0.130|255.255.255.252|
|**Router2**    |ether3  |192.168.0.254|255.255.255.192|
|**PC2**        |e0      |192.168.0.193|255.255.255.192|

# Paso 2

### Router 1
```
ip address add address=192.168.0.126 interface=ether3
ip address add address=192.168.0.129 interface=ether2
```

### Router 2
```
ip address add address=192.168.0.254 interface=ether3
ip address add address=192.168.0.130 interface=ether2
```

# Paso 3
Sabemos que la interfaz fisica esta activa porque el mismo router lo indica con luces.

# Paso 4
Ping de **PC1** a **Router1**

```
ping 192.168.0.126

Haciendo ping a 192.168.0.126 con 32 bytes de datos:
Respuesta desde 192.168.0.126: bytes=32 tiempo<1m TTL=64
Respuesta desde 192.168.0.126: bytes=32 tiempo<1m TTL=64
Respuesta desde 192.168.0.126: bytes=32 tiempo<1m TTL=64
Respuesta desde 192.168.0.126: bytes=32 tiempo<1m TTL=64
```

Ping de **PC1** a **PC2**
```
ping 192.168.0.193

Haciendo ping a 192.168.0.193 con 32 bytes de datos:
Respuesta desde 192.168.0.126: Red de destino inaccesible.
Respuesta desde 192.168.0.126: Red de destino inaccesible.
Respuesta desde 192.168.0.126: Red de destino inaccesible.
Respuesta desde 192.168.0.126: Red de destino inaccesible.

Estadísticas de ping para 192.168.0.193:
    Paquetes: enviados = 4, recibidos = 4, perdidos = 0
    (0% perdidos),
```

# Paso 5
Configurar tabla de reenvio de **Router1**. Gateway es la IP del siguiente salto.
```
ip route add dst-address=192.168.0.192/26 gateway=192.168.0.130 
```

Configurar tabla de reenvio de **Router2**.
```
ip route add dst-address=192.168.0.0/25 gateway=192.168.0.129
```

# Paso 6
```
ping 192.168.0.193

Haciendo ping a 192.168.0.193 con 32 bytes de datos:
Respuesta desde 192.168.0.193: bytes=32 tiempo=1ms TTL=126
Respuesta desde 192.168.0.193: bytes=32 tiempo=1ms TTL=126
Respuesta desde 192.168.0.193: bytes=32 tiempo=1ms TTL=126
Respuesta desde 192.168.0.193: bytes=32 tiempo=1ms TTL=126

Estadísticas de ping para 192.168.0.193:
    Paquetes: enviados = 4, recibidos = 4, perdidos = 0
    (0% perdidos),
Tiempos aproximados de ida y vuelta en milisegundos:
    Mínimo = 1ms, Máximo = 1ms, Media = 1ms
```

# Paso 7
Captura de Wireshark


|No.	|Time	    |Source	        |Destination	|Protocol	|Length	|Info   |
|-      |-          |-              |-              |-          |-      |-      |
|32     |40.300213	|192.168.0.1    |192.168.0.193	|ICMP       |74     |Echo (ping) request<br>id=0x0001,<br>seq=48/12288,<br>ttl=128 (reply in 33)|
|33	    |40.301565	|192.168.0.193	|192.168.0.1	|ICMP	    |74	    |Echo (ping) reply<br>id=0x0001,<br>seq=48/12288,<br>ttl=126 (request in 32)|


El TTL capturado en la conexion de PC1 a Router1 fue 128, que es el TTL inicial. Tiene sentido porque todavía no salio de la red de PC1, no paso por ningun router que disminuya este valor. Luego, cuando el mismo paquete es capturado en la conexion con la PC2 y el Router2, el TTL es 126, que también tiene sentido porque paso por dos routers.