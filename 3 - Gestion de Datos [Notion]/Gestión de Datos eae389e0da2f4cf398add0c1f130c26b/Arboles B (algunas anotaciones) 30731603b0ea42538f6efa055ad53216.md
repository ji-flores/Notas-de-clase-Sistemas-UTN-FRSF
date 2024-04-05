# Arboles B (algunas anotaciones)

# Glosario

- **N**: Nodo actual.
- **HerD**: Nodo heramano de la derecha.
- **HerI**: Nodo hermano de la izquierda.

# Estructura

Hay un nodo por bloque.

# Algoritmo de eliminación. Diferentes casos

### Es hoja?

- N es hoja:
    - Se elimina el valor.
- N no es hoja:
    - Se borra y se flota el la *menor* clave hoja a la derecha o la *mayor* clave hoja a izquierda. Revisar posible desocupación del hijo que floto clave.

### Alguno nodo quedó subocupado?

- N esta subocupado:
    - **HerD** o **HerI** puede prestar clave (no está al mínimo de claves):
        - Si presta **HerD**, baja la clave padre y su lugar lo ocupa el menor de HD.
        - Si presta **HerI**, baja la clave padre y su lugar lo ocupa el mayor de HI.
    - Ni **HerD** ni **HerI** pueden prestar clave:
        - Baja una clave padre y se fusionan sus hijos.
- N no esta subocupado:
    - Fin.

> Recordar que el algoritmo es iterativo. Después de cada paso es posible que tengan que realizarse nuevos checkeos de subocupación.
> 

# Inserción

Inserción de un elemento:

Siempre se insertan nodos en las hojas. Si en la hoja que corresponde no hay lugar, se parte el nodo en dos por la mitad y se sube el valor del medio un nivel.