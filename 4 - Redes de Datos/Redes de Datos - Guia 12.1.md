# Ejercicio 1

|Nº  |Interfaz|Sentido de flujo|Direccion de origen|Direccion de destino|Protocolo           |Puerto de origen|Puerto de destino|Flag ACK|Accion  |
|----|--------|----------------|-------------------|--------------------|--------------------|----------------|-----------------|--------|--------|
|1 ??|eth0    |Saliente        |152.170.179.205/32 |0.0.0.0/0           |TCP                 |> 1023          |80 o 443         |Si/No   |Permitir|
|2   |eth0    |Entrante        |0.0.0.0/0          |152.170.179.205/32  |TCP                 |80 o 443        |> 1023           |Si      |Permitir|
|3   |eth0    |Saliente        |152.170.179.205/32 |152.170.179.205/16  |ICMP Msg: Echo Req. |Vacio           |Vacio            |Vacio   |Permitir|
|4   |eth0    |Entrante        |152.170.179.205/16 |152.170.179.205/32  |ICMP Msg: Echo Reply|Vacio           |Vacio            |Vacio   |Permitir|
|5   |eth0    |Entrante        |152.170.179.205/16 |152.170.179.205/32  |ICMP Msg: Echo Req. |Vacio           |Vacio            |Vacio   |Permitir|
|6   |eth0    |Saliente        |152.170.179.205/32 |152.170.179.205/16  |ICMP Msg: Echo Reply|Vacio           |Vacio            |Vacio   |Permitir|
|7   |eth0    |E/S             |0.0.0.0/0          |0.0.0.0/0           |Vacio               |Vacio           |Vacio            |Vacio   |Denegar |

# Ejercicio 2
|Nº  |Interfaz|Sentido de flujo|Direccion de origen|Direccion de destino|Protocolo           |Puerto de origen|Puerto de destino|Flag ACK|Accion  |
|----|--------|----------------|-------------------|--------------------|--------------------|----------------|-----------------|--------|--------|
|1   |eth0    |Entrante        |0.0.0.0/0          |10.0.32.9/32        |ICMP                |Vacio           |Vacio            |Vacio   |Permitir|
|2   |eth0    |Saliente        |10.0.32.9/32       |0.0.0.0/0           |ICMP Msg: Echo Req. |Vacio           |Vacio            |Vacio   |Permitir|
|3 ??|eth0    |Entrante        |0.0.0.0/0          |10.0.32.9/32        |TCP                 |Vacio           |23               |Si/No   |Denegar |
|4 ??|eth0    |Saliente        |10.0.32.9/32       |0.0.0.0/0           |TCP                 |23              |Vacio            |Si/No   |Denegar |
|5   |eth0    |Saliente        |10.0.32.9/32       |0.0.0.0/0           |TCP                 |> 1023          |80               |Si/No   |Permitir|
|6   |eth0    |Entrante        |0.0.0.0/0          |10.0.32.9/32        |TCP                 |80              |> 1023           |Si      |Permitir|
|7   |eth0    |Entrante        |10.0.32.9/20       |10.0.32.9/32        |TCP                 |> 1023          |22               |Si/No   |Permitir|
|8   |eth0    |Saliente        |10.0.32.9/32       |10.0.32.9/20        |TCP                 |22              |> 1023           |Si      |Permitir|
|9   |eth0    |E/S             |0.0.0.0/0          |0.0.0.0/0           |Vacio               |Vacio           |Vacio            |Vacio   |Denegar |

# Ejercicio 3
### a)

 1. No. 10.1.1.5 puede conectarse a puertos 80 ajenos, pero otros hosts no pueden conectarse a su puerto 80.
 2. Si. Las reglas 1 y 2 permiten abrir conexiones a dispositivos dentro de la LAN con puerto 110 (POP3), siempre que lo hagan desde un puerto que no corresponde a servicios conocidos (preguntar porqué es esto después).
 3. Si. El firewall permite que el host quiera abrir conexiones con el puerto 80 de cualquier dispositivo.
 4. No. No existe una regla que permita abrir conexiones con el puerto 110 de ningún dispositivo, y la configuración por defecto es *denegar*.
 5. No. No puede intercambiar mensajes ICMP con ningun dispositivo externo.
 6. Idem 5.
 7. Si. Permite la entrada y salida de paquetes provenientes de, o con destino a la interfaz de loopback (que escucha la dirección 127.0.0.1), independiente de su protocolo.
 8. Idem 7.
 9. La política por defecto de trafico tanto entrante como saliente es *denegar*.

### Inciso b)
|Nº  |Interfaz|Sentido de flujo|Direccion de origen|Direccion de destino|Protocolo           |Puerto de origen|Puerto de destino|Flag ACK|Accion  |
|----|--------|----------------|-------------------|--------------------|--------------------|----------------|-----------------|--------|--------|
|1   |eth0    |Entrante        |10.1.1.0/24        |10.1.1.5            |TCP                 |>1023           |110              |Sí/No   |Permitir|
|2   |eth0    |Saliente        |10.1.1.5           |10.1.1.0/24         |TCP                 |110             |>1023            |Sí      |Permitir|
|3   |eth0    |Entrante        |10.1.1.5           |0.0.0.0/0           |TCP                 |>1023           |80               |Sí/No   |Permitir|
|4   |eth0    |Saliente        |0.0.0.0/0          |10.1.1.5            |TCP                 |80              |>1023            |Sí      |Permitir|
|5   |eth0    |Entrante        |10.1.1.4/32        |10.1.1.5/32         |TCP                 |>1023           |80               |Si/No   |Permitir|
|6   |eth0    |Saliente        |10.1.1.5/32        |10.1.1.4/32         |TCP                 |80              |>1023            |Si      |Permitir|
|7   |eth0    |Saliente        |10.1.1.5/32        |192.168.0.1/32      |TCP                 |>1023           |110              |Si/No   |Permitir|
|8   |eth0    |Entrante        |192.168.0.1/32     |10.1.1.5/32         |TCP                 |110             |>1023            |Si      |Permitir|
|9   |eth0    |Entrante        |10.1.1.4/32        |10.1.1.5/32         |ICMP Msg: Echo Reply|Vacio           |Vacio            |Vacio   |Permitir|
|10  |eth0    |Saliente        |10.1.1.5/32        |10.1.1.4/32         |ICMP Msg: Echo Req. |Vacio           |Vacio            |Vacio   |Permitir|
|11  |lo      |E/S             |Vacio              |Vacio               |Vacio               |Vacio           |Vacio            |Vacio   |Permitir|
|12  |Vacio   |Vacio           |0.0.0.0/0          |0.0.0.0/0           |Vacio               |Vacio           |Vacio            |Vacio   |Denegar |