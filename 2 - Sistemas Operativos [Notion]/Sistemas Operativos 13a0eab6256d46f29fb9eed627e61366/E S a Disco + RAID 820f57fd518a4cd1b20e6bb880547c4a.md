# E/S a Disco + RAID

## Planificación de E/S a disco

Cuando el SO debe acceder a disco, no necesariamente se accede en el orden en el que se generaron esas solicitudes. Esto se debe a que las solicitudes pueden ser a lugares muy lejanos en el disco, lo cual implica mucho tiempo de mecánica. Existen algoritmos para planificar este acceso. El algoritmo puede tenerlo la controladora de disco, dejando de ser responsabilidad del SO.

*Los algoritmos están explicados en videos…*

*Posible pregunta: Cuantos movimientos hizo el brazo, cuanto tardó.*

## RAID

**aka: Redundant Array of Inexpensive Disks o Redundant Array of Independent Disks**

- Toma un conjunto de discos y los organiza de modo tal que para el SO sean vistos no como discos distintos sino como algo más (depende como se implemente)
- Se implementa teniendo una controlodora que soporte RAID.

### Tipos de RAID

- **RAID 0:** La controladora presenta los discos al SO como un solo disco. Tiene ciertas ventajas como lectura simultanea en ambos discos, se pueden armar filesystems más grandes. La desventaja es que si se rompe cualquiera de los discos, se pierde el filesystem entero.
- **RAID 1:** “Espejo”. Hay dos discos, un disco guarda información y el otro es siempre una copia del otro. Entonces se invierte el 50% del espacio en redundancia, evitando perder información y permitiendo lectura simultanea.
- **RAID 2:** Se distribuyen los bits en diferentes discos, bit 1 se guarda en disco 1, bit 2 en disco 2,… Guarda información también para evitar errores. Es una muy mala solución.
- **RAID 3:** Hace lo mismo que RAID 2 pero en vez de bits por byte, y se guarda un disco para comparar paridad entre los bytes.
- **RAID 4:** Hace lo mismo que RAID 3 pero en unidades más grandes como bloques, ahora el disco guarda paridad entre estas unidades/bloques.

RAID 2, 3, 4: Hay muchas chances que el disco de paridad se rompa por ser el más usado.

- **RAID 5:** Misma idea que RAID 4, pero va distribuyendo la información de paridad entre los discos

RAID 2-5 solo soporta la corrupción de un solo disco, para dos discos el checkeo de paridad ya es inutil.

RAID 5 es el más popular, también es la combinación de varias implementaciones

*INSERTAR IMAGENES DE LOS RAID*