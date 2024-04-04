# Ejercicio 1

## 1.a)

Las tablas de cada PC quedarían:

#### PC1
```
20:45:D3:F1:C2:1A 10.1.1.2 expires in 120 seconds
```

#### PC2
```
B1:23:5C:F2:A3:DE 10.1.1.1 expires in 120 seconds
```

#### PC3
*Vacía*

## 1.b)

#### PC1
*Vacía*

#### PC3
```
20:45:D3:F1:C2:1A 10.1.1.2 expires in 80 seconds
```

## 1.c)
La secuencia de mensajes ARP es la siguiente:
1. **ARP Request** de **PC2** (10.0.0.2) preguntando por **PC3** (10.0.0.3) con un broadcast (255.255.255.255).
    + Para iniciar el flujo de mensajes, PC2 debe saber la dirección MAC de PC3.
2. **ARP Reply** de **PC3** (10.0.0.3) como unicast para **PC2** (10.0.0.2).
    + PC3 revela su dirección MAC a PC2 para que pueda enviarle mensajes.
3. **ARP Request** de **PC2** (10.0.0.2) preguntando por **PC3** (10.0.0.3) con un broadcast (255.255.255.255).
    + El temporizador de revalidación de PC2 caducó, y como actualmente se esta comunicando con PC3, envía otro ARP para revalidar la MAC de PC3.
4. **ARP Reply** de **PC3** (10.0.0.3) como unicast para **PC2** (10.0.0.2).
    + PC3 vuelve a revelar su dirección MAC a PC2.

## 1.d)

#### PC1
```
20:45:D3:F1:C2:1A 10.1.1.2 expires in 120 seconds
```

#### PC2
```
B1:23:5C:F2:A3:DE 10.1.1.1 expires in 120 seconds
```

#### PC3
```
B1:23:5C:F2:A3:DE 10.1.1.1 expires in 120 seconds
```

# Ejercicio 2

## 2.a)
+ **MAC Origen:** `MAC-A` (Host A).
+ **MAC Destino:** `MAC-R1` (Router 1, Interfaz 1).
+ **IP Origen:** `172.16.0.2` (Host A).
+ **IP Destino:** `172.16.1.0` (Host B).

## 2.b)
El datagrama, como unidad de capa 3, siempre tiene como IPs de origen y destino la IP del host que genero el mensaje, y la del host para quien ultimamente esta destinado el mensaje.

Las direcciones MAC solo interesan dentro de una LAN especifica. Dentro de la LAN1, las direcciones MAC son las del host original (porque justo estamos considerando la LAN de la cual este es parte), y la correspondiente a la puerta de enlace, la interfaz 1 del Router 1 (quien se encargará de hacer llegar el datagrama al destinatario final).

## 2.c)

+ **MAC Origen:** `MAC-R2` (Router 1, Interfaz 2).
+ **MAC Destino:** `MAC-B` (Host B).
+ **IP Origen:** `172.16.0.2` (Host A).
+ **IP Destino:** `172.16.1.0` (Host B).

# Ejercicio 3

Asumiendo que los mensajes se dan a 1 segundo de distancia.

### Paso a)
```
00-AC-59-ED-F3-45 200.10.10.2 expires in 120 seconds
```

### Paso b)
```
00-AC-59-ED-F3-45 200.10.10.2 expires in 119 seconds
00-AC-C5-89-EA-D4 200.10.10.1 expires in 120 seconds
```

### Paso c)
```
00-AC-59-ED-F3-45 200.10.10.2 expires in 118 seconds
00-AC-C5-89-EA-D4 200.10.10.1 expires in 119 seconds
```
(No se agregan cambios porque A ya tiene la información de R1 del mensaje anterior)
