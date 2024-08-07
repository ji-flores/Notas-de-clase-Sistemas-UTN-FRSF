# Ejercicio 1

|Nº  |Interfaz|Sentido de flujo|Direccion de origen|Direccion de destino|Protocolo           |Puerto de origen|Puerto de destino|Flag ACK|Accion  |
|----|--------|----------------|-------------------|--------------------|--------------------|----------------|-----------------|--------|--------|
|1   |eth0    |Saliente        |152.170.179.205/32 |0.0.0.0/0           |TCP                 |>1023           |80               |Si/No   |Permitir|
|2   |eth0    |Entrante        |0.0.0.0/0          |152.170.179.205/32  |TCP                 |80              |>1023            |Si      |Permitir|
|3   |eth0    |Saliente        |152.170.179.205/32 |0.0.0.0/0           |TCP                 |>1023           |443              |Si/No   |Permitir|
|4   |eth0    |Entrante        |0.0.0.0/0          |152.170.179.205/32  |TCP                 |443             |>1023            |Si      |Permitir|
|5   |eth0    |Saliente        |152.170.179.205/32 |152.170.0.0/16      |ICMP Msg: Echo Req. | -              | -               | -      |Permitir|
|6   |eth0    |Entrante        |152.170.0.0/16     |152.170.179.205/32  |ICMP Msg: Echo Reply| -              | -               | -      |Permitir|
|7   |eth0    |Entrante        |152.170.0.0/16     |152.170.179.205/32  |ICMP Msg: Echo Req. | -              | -               | -      |Permitir|
|8   |eth0    |Saliente        |152.170.179.205/32 |152.170.0.0/16      |ICMP Msg: Echo Reply| -              | -               | -      |Permitir|
|9   | -      | -              |0.0.0.0/0          |0.0.0.0/0           | -                  | -              | -               | -      |Denegar |

# Ejercicio 2
|Nº  |Interfaz|Sentido de flujo|Direccion de origen|Direccion de destino|Protocolo           |Puerto de origen|Puerto de destino|Flag ACK|Accion  |
|----|--------|----------------|-------------------|--------------------|--------------------|----------------|-----------------|--------|--------|
|1   |eth0    |Entrante        |0.0.0.0/0          |10.0.32.9/32        |ICMP                | -              | -               | -      |Permitir|
|2   |eth0    |Saliente        |10.0.32.9/32       |0.0.0.0/0           |ICMP Msg: Echo Req. | -              | -               | -      |Permitir|
|3   |eth0    |Entrante        |0.0.0.0/0          |10.0.32.9/32        |TCP                 | -              |23               |Si/No   |Denegar |
|4   |eth0    |Saliente        |10.0.32.9/32       |0.0.0.0/0           |TCP                 |23              | -               |Si/No   |Denegar |
|5   |eth0    |Saliente        |10.0.32.9/32       |0.0.0.0/0           |TCP                 |>1023           |80               |Si/No   |Permitir|
|6   |eth0    |Entrante        |0.0.0.0/0          |10.0.32.9/32        |TCP                 |80              |>1023            |Si      |Permitir|
|7   |eth0    |Entrante        |10.0.32.0/20       |10.0.32.9/32        |TCP                 |>1023           |22               |Si/No   |Permitir|
|8   |eth0    |Saliente        |10.0.32.9/32       |10.0.32.0/20        |TCP                 |22              |>1023            |Si      |Permitir|
|9   | -      | -              |0.0.0.0/0          |0.0.0.0/0           | -                  | -              | -               | -      |Denegar |

# Ejercicio 3

## Inciso a)

 1. No. 10.1.1.5 puede conectarse a puertos 80 ajenos, pero otros hosts no pueden conectarse a su puerto 80.
 2. Si. Las reglas 1 y 2 permiten abrir conexiones a dispositivos dentro de la LAN con puerto 110 (POP3), siempre que lo hagan desde un puerto que no corresponde a servicios conocidos (preguntar porqué es esto después).
 3. Si. El firewall permite que el host quiera abrir conexiones con el puerto 80 de cualquier dispositivo.
 4. No. No existe una regla que permita abrir conexiones con el puerto 110 de ningún dispositivo, y la configuración por defecto es *denegar*.
 5. No. No puede intercambiar mensajes ICMP con ningun dispositivo externo.
 6. Idem 5.
 7. Si. Permite la entrada y salida de paquetes provenientes de, o con destino a la interfaz de loopback (que escucha la dirección 127.0.0.1), independiente de su protocolo.
 8. Idem 7.
 9. La política por defecto de trafico tanto entrante como saliente es *denegar*.

## Inciso b)
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
|9   |eth0    |Entrante        |10.1.1.4/32        |10.1.1.5/32         |ICMP Msg: Echo Reply| -              | -               | -      |Permitir|
|10  |eth0    |Saliente        |10.1.1.5/32        |10.1.1.4/32         |ICMP Msg: Echo Req. | -              | -               | -      |Permitir|
|11  |lo      |E/S             | -                 | -                  | -                  | -              | -               | -      |Permitir|
|12  | -      | -              |0.0.0.0/0          |0.0.0.0/0           | -                  | -              | -               | -      |Denegar |

# Ejercicio 4
|Nº |Interfaz|Sentido de flujo|Direccion de origen|Direccion de destino|Protocolo           |Puerto de origen|Puerto de destino|Flag ACK|Accion  |
|---|--------|----------------|-------------------|--------------------|--------------------|----------------|-----------------|--------|--------|
|1  |eth0    |Entrante        |192.168.0.0/23     |192.168.0.5/32      |TCP                 |>1023           |3128             |SI/NO   |Permitir|
|2  |eth0    |Saliente        |192.168.0.5/32     |192.168.0.0/23      |TCP                 |3128            |>1023            |SI      |Permitir|
|3  |eth0    |Entrante        |192.168.0.0/23     |192.168.0.5/32      |ICMP Msg: Echo Req. |-               |-                |-       |Permitir|
|4  |eth0    |Saliente        |192.168.0.5/32     |192.168.0.0/22      |ICMP Msg: Echo Reply|-               |-                |-       |Permitir|
|5  |eth0    |Saliente        |192.168.0.5/32     |192.168.0.0/23      |ICMP Msg: Echo Req. |-               |-                |-       |Permitir|
|6  |eth0    |Entrante        |192.168.0.0/23     |192.168.0.5/32      |ICMP Msg: Echo Reply|-               |-                |-       |Permitir|
|7  |eth0    |Entrante        |192.168.0.200/32   |192.168.0.5/32      |TCP                 |>1023           |22               |SI/NO   |Permitir|
|8  |eth0    |Saliente        |192.168.0.5/32     |192.168.0.200/32    |TCP                 |22              |>1023            |SI      |Permitir|
|9  |ppp0    |Saliente        |200.45.177.2/32    |0.0.0.0/0           |TCP                 |>1023           |53               |SI/NO   |Permitir|
|10 |ppp0    |Entrante        |0.0.0.0/0          |200.45.177.2/32     |TCP                 |53              |>1023            |SI      |Permitir|
|11 |ppp0    |Saliente        |200.45.177.2/32    |0.0.0.0/0           |UDP                 |>1023           |53               |-       |Permitir|
|12 |ppp0    |Entrante        |0.0.0.0/0          |200.45.177.2/32     |UDP                 |53              |>1023            |-       |Permitir|
|13 |ppp0    |Saliente        |200.45.177.2/32    |0.0.0.0/0           |TCP                 |>1023           |80               |SI/NO   |Permitir|
|14 |ppp0    |Entrante        |0.0.0.0/0          |200.45.177.2/32     |TCP                 |80              |>1023            |SI      |Permitir|
|15 |ppp0    |Saliente        |200.45.177.2/32    |0.0.0.0/0           |TCP                 |>1023           |8080             |SI/NO   |Permitir|
|16 |ppp0    |Entrante        |0.0.0.0/0          |200.45.177.2/32     |TCP                 |8080            |>1023            |SI      |Permitir|
|17 |ppp0    |Saliente        |200.45.177.2/32    |0.0.0.0/0           |TCP                 |>1023           |443              |SI/NO   |Permitir|
|18 |ppp0    |Entrante        |0.0.0.0/0          |200.45.177.2/32     |TCP                 |443             |>1023            |SI      |Permitir|
|19 |lo      |E/S             |-                  |-                   |-                   |-               |-                |-       |Permitir|
|20 |-       |-               |0.0.0.0/0          |0.0.0.0/0           |-                   |-               |-                |-       |Denegar |

# Ejercicio 5
## Servidor Publico
|Inciso|Nº |Interfaz|Sentido de flujo|Direccion de origen|Direccion de destino|Protocolo               |Puerto de origen|Puerto de destino|Flag ACK|Accion  |
|------|---|--------|----------------|-------------------|--------------------|------------------------|----------------|-----------------|--------|--------|
|a)    |1  |lo      |I/O             |-                  |-                   |-                       |-               |-                |-       |Permitir|
|b)    |2  |eth0    |IN              |0.0.0.0/0          |181.1.5.1/32        |TCP                     |>1023           |25               |SI/NO   |Permitir|
|b)    |3  |eth0    |OUT             |181.1.5.1/32       |0.0.0.0/0           |TCP                     |25              |>1023            |SI      |Permitir|
|b)    |4  |eth0    |IN              |0.0.0.0/0          |181.1.5.1/32        |TCP                     |>1023           |80               |SI/NO   |Permitir|
|b)    |5  |eth0    |OUT             |181.1.5.1/32       |0.0.0.0/0           |TCP                     |80              |>1023            |SI      |Permitir|
|b)    |6  |eth0    |IN              |0.0.0.0/0          |181.1.5.1/32        |TCP                     |>1023           |443              |SI/NO   |Permitir|
|b)    |7  |eth0    |OUT             |181.1.5.1/32       |0.0.0.0/0           |TCP                     |443             |>1023            |SI      |Permitir|
|c)    |8  |eth0    |OUT             |181.1.5.1/32       |0.0.0.0/0           |TCP                     |>1023           |25               |SI/NO   |Permitir|
|c)    |9  |eth0    |IN              |0.0.0.0/0          |181.1.5.1/32        |TCP                     |25              |>1023            |SI/NO   |Permitir|
|d)    |10 |eth0    |IN              |10.1.1.0/24        |181.1.5.1/32        |TCP                     |>1023           |110              |SI/NO   |Permitir|
|d)    |11 |eth0    |OUT             |181.1.5.1/32       |10.1.1.0/24         |TCP                     |110             |>1023            |SI      |Permitir|
|d)    |12 |eth0    |IN              |10.1.1.0/24        |181.1.5.1/32        |TCP                     |>1023           |23               |SI/NO   |Permitir|
|d)    |13 |eth0    |OUT             |181.1.5.1/32       |10.1.1.0/24         |TCP                     |23              |>1023            |SI      |Permitir|
|e)    |14 |eth0    |IN              |10.1.1.0/24        |181.1.5.1/32        |ICMP (msg =  Echo Req.) |-               |-                |-       |Permitir|
|e)    |15 |eth0    |OUT             |181.1.5.1/32       |10.1.1.0/24         |ICMP (msg =  Echo Reply)|-               |-                |-       |Permitir|
|f)    |16 |eth0    |OUT             |181.1.5.1/32       |0.0.0.0/0           |TCP                     |>1023           |53               |SI/NO   |Permitir|
|f)    |17 |eth0    |IN              |0.0.0.0/0          |181.1.5.1/32        |TCP                     |53              |>1023            |SI      |Permitir|
|f)    |18 |eth0    |OUT             |181.1.5.1/32       |0.0.0.0/0           |UDP                     |>1023           |53               |-       |Permitir|
|f)    |19 |eth0    |IN              |0.0.0.0/0          |181.1.5.1/32        |UDP                     |53              |>1023            |-       |Permitir|
|i)    |20 |eth0    |IN              |10.1.1.3/32        |181.1.5.1/32        |-                       |-               |-                |-       |Permitir|
|i)    |21 |eth0    |OUT             |181.1.5.1/32       |10.1.1.3/32         |-                       |-               |-                |-       |Permitir|
|-     |22 |eth0    |-               |0.0.0.0/0          |0.0.0.0/0           |-                       |-               |-                |-       |Denegar|

## Servidor Privado
|Inciso|Nº |Interfaz|Sentido de flujo|Direccion de origen|Direccion de destino|Protocolo               |Puerto de origen|Puerto de destino|Flag ACK|Accion  |
|------|---|--------|----------------|-------------------|--------------------|------------------------|----------------|-----------------|--------|--------|
|a)    |1  |lo      |I/O             |-                  |-                   |-                       |-               |-                |-       |Permitir|
|g)    |2  |eth0    |IN              |10.1.1.0/24        |10.1.1.200/32       |TCP                     |>1023           |443              |SI/NO   |Permitir|
|g)    |3  |eth0    |OUT             |10.1.1.200/32      |10.1.1.0/24         |TCP                     |443             |>1023            |SI      |Permitir|
|g)    |4  |eth0    |IN              |10.1.1.0/24        |10.1.1.200/32       |TCP                     |>1023           |5432             |SI/NO   |Permitir|
|g)    |5  |eth0    |OUT             |10.1.1.200/32      |10.1.1.0/24         |TCP                     |5432            |>1023            |SI      |Permitir|
|h)    |6  |eth0    |IN              |10.1.1.0/24        |10.1.1.200/32       |ICMP (msg = Echo Req.)  |-               |-                |-       |Permitir|
|h)    |7  |eth0    |OUT             |10.1.1.200/32      |10.1.1.0/24         |ICMP (msg = Echo Reply) |-               |-                |-       |Permitir|
|h)    |8  |eth0    |OUT             |10.1.1.200/32      |10.1.1.0/24         |ICMP (msg = Echo Req.)  |-               |-                |-       |Permitir|
|h)    |9  |eth0    |IN              |10.1.1.0/24        |10.1.1.200/32       |ICMP (msg = Echo Reply) |-               |-                |-       |Permitir|
|i)    |10 |eth0    |IN              |10.1.1.3/32        |181.1.5.1/32        |-                       |-               |-                |-       |Permitir|
|i)    |11 |eth0    |OUT             |181.1.5.1/32       |10.1.1.3/32         |-                       |-               |-                |-       |Permitir|
|-     |12 |eth0    |-               |0.0.0.0/0          |0.0.0.0/0           |-                       |-               |-                |-       |Permitir|
