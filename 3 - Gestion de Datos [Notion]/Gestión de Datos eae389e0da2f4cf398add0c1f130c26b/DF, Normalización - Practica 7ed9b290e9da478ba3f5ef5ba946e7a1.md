# DF, Normalización - Practica

Reglas de inferencia usadas:

Regla 1:  $Y\sube X \; \implies X \rarr Y$

Regla 3:  $X \rarr Y \; \land \; Y \rarr Z \; \implies \; X \rarr Z$

Regla 5:  $X \rarr Y \; \land \; X \rarr Z \implies X \rarr YZ$

El algoritmo de determinación de clausura de X bajo F funciona por la siguiente deducción lógica:

1. $X \rarr X^+$, por definición de clausura.
2. $Y \rarr Z$, es una dependencia funcional del conjunto F de las dependencias funcionales de R.
3. $Y \sube X$
4. $X \rarr Y$, por Regla 1, usando hecho 3.
5. $X \rarr Z$, por Regla 3, usando hechos 2. y 4.
6. $X \rarr X^+ Z$, por Regla 5, usando hechos 1. y 5.

## Ejercicio 6

**Dependencias funcionales:**

$\text{Autor} \rightarrow \text{Nacionalidad}$

$\text{Cod\_Libro} \rightarrow \text{Titulo,Editorial,Año}$

Clave primaria: $\text{Autor,Cod\_Libro}$

1. Anomalías detectadas:
    1. Anomalías de inserción: Agregar un autor obliga a agregar datos sobre un libro que publicó (o a tener muchas columnas en NULL)
    2. Anomalías de eliminación: Eliminar el libro de codigo 112233 de la base de datos obliga a eliminar por completo la información de los autores Kim,W. y Lochovsky.
    3. Anomalías de modificación: Querer modificar la nacionalidad de un autor como Date, C. obliga a modificar todas las tuplas correspondientes a libros de los que sea autor.
2. **Primera forma normal**: Ya se encuentra en primera forma normal. No hay artibutos multivaluados ni compuestos.
    
    ![Untitled](DF,%20Normalizacio%CC%81n%20-%20Practica%207ed9b290e9da478ba3f5ef5ba946e7a1/Untitled.png)
    
    **Segunda forma normal:** Se separan los atributos que dependen parcialmente de la clave primaria.
    
    ![Untitled](DF,%20Normalizacio%CC%81n%20-%20Practica%207ed9b290e9da478ba3f5ef5ba946e7a1/Untitled%201.png)
    
    **Tercera forma normal:** Ya está en tercera forma normal. Todos los atributos dependen directamente y no transitivamente de la clave primaria.