# 04/05 - Inner Class / Clases Anon. / Lambda

Clases embedidas en otras clases (clases internas): OuterClass puede ver los elementos privados de InnerClass. No viceversa.

Clases anonimas.

Son clases internas, definidas sobre la marcha. Cuando se necesitan se definen.

Saludo es una interface, como se crea una instancia de una interface? Lo que se hace es que en la linea se crea una clase que implementa la interface. El compilador termina creando una clase aparte como cualquier otra.

- Pag 15. La funcion lambda es instancia de la interfaz funcional “Comparator<T>”, que es una interfaz funcional porque tiene **un solo metodo abstracto, que no overridea un metodo de Object**.