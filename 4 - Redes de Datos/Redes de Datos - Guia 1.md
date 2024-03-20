# Paso 1: Enlace directo

| IP PC1         | IP PC2           | ¿Exito? |
| -------------- | ---------------- | ------- |
| 192.168.1.1/24 | 192.168.2.1/24   | No ("No gateway found") |
| 192.168.1.1/25 | 192.168.1.129/25 | No ("No gateway found") |
| 192.168.1.1/24 | 192.168.1.129/25 | No (Timeout) |
| 192.168.1.1/24 | 192.168.1.2/24   | Si |

No puedo detectar que es lo diferente en el ultimo caso que permite que el intercambio se pueda dar...

# Paso 2: HUB

Se vuelve a usar el último par de IPs (el único que funcionó), pero esta vez, en vez de un enlace directo, teniendo de intermediario un Hub. El ping sigue siendo exitoso. Desde la consola de PC1:
```
PC1> ping 192.168.1.2/24

84 bytes from 192.168.1.2 icmp_seq=1 ttl=64 time=0.524 ms
84 bytes from 192.168.1.2 icmp_seq=2 ttl=64 time=0.624 ms
84 bytes from 192.168.1.2 icmp_seq=3 ttl=64 time=0.872 ms
84 bytes from 192.168.1.2 icmp_seq=4 ttl=64 time=0.666 ms
84 bytes from 192.168.1.2 icmp_seq=5 ttl=64 time=0.755 ms
```

## Asignar IP a una interfaz en Ubuntu

> **Nota:** Instalé la versión 18.04 de Ubuntu Cloud Server que es, de las que estan disponibles en el servidor de GNS3, la más cercana a la 16.04 (la que pide el documento de la catedra). No pude encontrar el `ubuntu-cloud-init-data.iso` para esa versión y me estaba trayendo problemas.

Resultado del ping de PC1 a UbuntuCloudSever:

```
PC1> ping 192.168.1.3

84 bytes from 192.168.1.3 icmp_seq=1 ttl=64 time=1.553 ms
84 bytes from 192.168.1.3 icmp_seq=2 ttl=64 time=1.173 ms
84 bytes from 192.168.1.3 icmp_seq=3 ttl=64 time=1.468 ms
84 bytes from 192.168.1.3 icmp_seq=4 ttl=64 time=1.537 ms
84 bytes from 192.168.1.3 icmp_seq=5 ttl=64 time=1.299 ms
```

Resultado del ping de PC2 a UbuntuCloudSever:

```
PC2> ping 192.168.1.3

84 bytes from 192.168.1.3 icmp_seq=1 ttl=64 time=2.702 ms
84 bytes from 192.168.1.3 icmp_seq=2 ttl=64 time=1.410 ms
84 bytes from 192.168.1.3 icmp_seq=3 ttl=64 time=1.308 ms
84 bytes from 192.168.1.3 icmp_seq=4 ttl=64 time=1.369 ms
84 bytes from 192.168.1.3 icmp_seq=5 ttl=64 time=1.232 ms
```

## Captura de tráfico
### Consigna

Iniciar una captura de tráfico entre la PC3 y el hub. Para ello, debe hacer clic derecho en el enlace y seleccionar la opción Start Capture.

Luego, ingrese el tipo de enlace y el nombre del fichero de la captura. Se abrirá el software Wireshark y se mostrará el tráfico capturado en dicha herramienta.Ingeniería en Sistemas de Información.

Mientras que se está escuchando el enlace, realizar un ping entre PC1 y PC2. Luego, diríjase a Wireshark y detenga la captura. ¿Qué sucede? Reflexione acerca de este comportamiento.

### Respuesta

Pudo verse el intercambio del ping entre PC1 y PC2 en ese enlace, porque el dispositivo que se está usando es un Hub, que no distingue para quien es cada mensaje, solo "concentra" las conexiones.

# Paso 3: Switch
### Consigna
En la topología anterior reemplazar el hub por un switch. Consulte la guía GNS3 Configuración de dispositivos para agregar un Ethernet switch (Switches -> Ethernet switch).

Vuelva a capturar el tráfico en el enlace entre la PC3 y el switch. Luego, realice nuevamente un ping entre la PC1 y la PC2 y vuelva a Wireshark. ¿El intercambio de paquetes fue capturado? ¿A qué se debe esta diferencia de comportamiento?

### Respuesta
Ahora el intercambio entre PC1 y PC2 no es capturado. Esto se debe a que los switches aislan las conexiones entre cada par de puertos, y al ser dispositivos de Capa 2, cada vez que reciben tramas en un puerto, pueden leer su destinatario y saber por cual conexión redirigirla.
