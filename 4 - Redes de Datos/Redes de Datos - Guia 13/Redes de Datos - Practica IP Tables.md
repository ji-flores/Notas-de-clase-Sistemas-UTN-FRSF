Firewall: Es un conjunto de funcionalidades entre las que está el filtrado de paquetes.

Implementaciones particulares de filtrado de paquetes:

+ Cisco ACL.
+ Windows Firewall: Maneja dos perfiles (conjuntos de reglas): redes publicas y privadas. También hay una configuración avanzada, donde se agrupan reglas de entrada y de salida.
  + Una particularidad es que permite filtrar programas, quedando más arriba que la capa de transporte. 
+ **IPTables**.

# IP Tables

### Sintaxis general

```sh
iptables -t <tabla> -<comando> <cadena> <cadena> {opciones} -j <accion>
```

Tabla: Son conjuntos de reglas. Hay tres tablas que indican que tpo de operación...

Si se usa por default puede obviarse `-t <tabla>`

Comando: 
+ A: Agrega una regla al final de la cadena (append).
+ D: Borra una regla de una cadena que coincida con la expresión.
+ D <Nro. Regla>: Borra una regla que tenga ese numero en la cadena.
+ .
+ .
+ F: Se vacia una cadena.
+ L: Lista todas las reglas.
+ P: Politica por defecto de una cadena.

Una cadena es un conjunto de reglas, hacen referencia al sentido del trafico. Vamos a usar tipicamente INPUT y OUTPUT, pero tambien existen FORWARD, PREROUTING y POSTROUTING.

(El resto en diapo.)

Para especificación de **rangos** en los puertos se usa `i:f`, donde los extremos son inclusivos. Las subredes y los hosts se hacen igual que en la teoría, usando dirección y mascara (mascara o comodín, mas bien). Omitir el comodin es lo mismo que poner /32, es para indicar hosts.

Las politicas por defecto no son reglas en si, se chequean ultimas por mas que se computen primeras, por ejemplo.

¿Que pasa con el ACK? Se usa la opción `-m`.

`-m state --state ESTABLISHED,NEW`. "ESTABLISHED" es una conexión TCP establecida (donde el ACK va ser siempre 1) y "NEW" es una conexión que se esta estableciendo, o nueva, (donde el ACK es 0, es el primer SYN).

¿Especificar mensajes ICMP? `-p icmp --icmp-type <Tipo de msj.>`