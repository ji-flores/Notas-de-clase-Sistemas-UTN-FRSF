# 21/03 - Presentación 03

- No se recomienda el uso de variables y métodos de clase, ya que son fuentes frecuentes de errores y es difícil hacer un seguimiento de los mismos.
- Es recomendable evitar el uso de `short` y `byte`, salvo que realmente se deba ahorrar en memoria. Generalmente no es necesario y solo genera problemas.
- En Java, todos los parámetros se pasan por **copia**, pero como lo que las variables guardan suelen ser punteros a objetos, es muy similar a un pase de parámetros por referencia.
- Un array en java tiene una variable pública **length** que almacena la longitud del array. No se tiene en cuenta si los elementos del array están inicializados o no.
- No se puede inicializar arrays con un *foreach.* Funcionan declarando una variable auxiliar, que copia el valor de cada elemento del array. Lo que estas haciendo es simplemente asignar un valor a la variable auxiliar, no modificando el contenido del array.
- Existe una clase `ArrayList` (del paquete `util`**)** que funciona de manera similar al `vector` de la librería STL. La diferencia es que el tipo de datos es heterogeneo, si se desea se podrían almacenar objetos instancia de cualquier clase, inicializandolo como `ArrayList<Object>`, ya que `Object` es superclase de cualquier clase.
- El “nombre completo” de una Clase es `<nombrePaquete>.<nombreClase>` . Entonces, como si se tratara de distintos directorios, uno puede tener clases con el mismo nombre bajo distintos paquetes, y solo se distinguen cuando se las “llama” con su nombre completo.
    
    Ej: Tanto `java.util` como `java.sql` contienen la clase `Date`. Si tengo ambos paquetes importados en un mismo archivo y quiero declarar un objeto `Date`, debo especificar a cual de las dos `Date` me estoy refiriendo. Osea, `java.util.Date miObjeto` o`java.sql.Date miObjeto`.
    
- Los objetos String son inmutables. Si estoy apuntando a un String y ahora asigno otro string a la variable, ya no estoy apuntando al mismo objeto String sino a otro nuevo que representa al string luego de las modificaciones.
- Java provee dos clases de String “mutables”. Utiles para cuando se deben modificar los strings.
    - `java.lang.StringBuffer`
    - `java.lang.StringBuilder`
- Existe una manera de definir *enumerados* (:D). Se define un “tipo de dato” con un dominio restringido, que seran los valores definidos allí. Se pueden agregar métodos pero no es recomendable.