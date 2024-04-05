# Archivos - Practica

## Ejercicio 1

Tamaño de registro ($R$) = 30+9+49+9+8+1+4+4+3+1 = 118 bytes.

Un bloque posee 512kb.

$fbi$ = 4 regs/bloque.

$b$ = 5000 bloques/archivo.

La cantidad promedio de bloques que deberán revisarse es $b/2$ = 2500 bloques.

Si esta dado el DNI, se esta buscando por el campo de ordenamiento, por lo que el promedio de bloques a revisar es $\lceil \log_2(b) \rceil$ = 13 bloques.

## Ejercicio 2

![Untitled](Archivos%20-%20Practica%2082b9af1cfc384bc782a0ae21cb13434c/Untitled.png)

### Direccionamiento abierto

![Untitled](Archivos%20-%20Practica%2082b9af1cfc384bc782a0ae21cb13434c/Untitled%201.png)

### Encadenamiento

![Untitled](Archivos%20-%20Practica%2082b9af1cfc384bc782a0ae21cb13434c/Untitled%202.png)

## Ejercicio 3

![Untitled](Archivos%20-%20Practica%2082b9af1cfc384bc782a0ae21cb13434c/Untitled%203.png)

### Direcc. abierto

![Untitled](Archivos%20-%20Practica%2082b9af1cfc384bc782a0ae21cb13434c/Untitled%204.png)

### Encadenamiento

![Untitled](Archivos%20-%20Practica%2082b9af1cfc384bc782a0ae21cb13434c/Untitled%205.png)

## Ejercicio 8

1. R = 123 [byte]
2. $fbi = \lfloor B/R \rfloor = 4$ 
$b = \lceil r/fbi \rceil = 7500$
3. .
    1. Factor de bloque del indice: Cant. de indices por bloque. $fbi_i = \lfloor B/R_i \rfloor = \lfloor\frac{512 byte}{9+6 byte}\rfloor = 34$
    2. Numero de entradas ($r_i$) = Numero de bloques ($b$) = $7500$
    Cant. de bloques ($b_i$) = $\lceil r_i / fbi_i \rceil = 221$
    3.  $f_o = fbi_i$. Cant. de niveles necesarios: $t = \lceil \log_{f_o}(r_i) \rceil = 3$.
    4. Cant. de accesos a disco necesarios: $t + 1 = 4$