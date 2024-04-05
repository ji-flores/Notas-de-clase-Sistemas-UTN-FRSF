# File System - pt. I

# Sistema de archivos

Dos maneras de verlo:

- Vision de usuario: Que es un archivo, como se ve, que es un directorio, como se organizan.
- Vision del SO: Como logra el SO relacionar sectores de disco con archivos.

Atributos ≠ Metadatos

Atributos: Estan en el filesystem.

Metadatos: Forman parte del archivo.

### Estructura de archivos

- Secuencia de bytes
- Secuencia de registros
- Árbol: Lo usan databases

### Tipos de archivos

- ASCII: Formado por lineas de texto, pueden editarse o imprimirse directamente.
- Binarios: Archivos ejecutables, objetos, datos no textuales.
- Especiales (UNIX): Caracter, bloque. Ej: /dev/fd0 (floppy), archivos que representan discos, dispositivos de entrada salida.

### Directorios

Es un archivo cuyo contenido son referencias a archivos que forman parte del mismo (entradas de directorio). Los atributos del archivo pueden estar contenido dentro de la entrada de directorio o bien en otra parte del file system, y cada entrada de directorio contiene información.

La direccion a los bloques que componen el archivo pueden estar en la entrada de directorio o bien en los atributos. 

### Estructura lógica del directorio

- Plana.
- De dos niveles.
- Jerárquica.
- Grafo Aciclico.

---

Puede haber relacion 1 Bloque ⇒ 1 Sector o 1 Bloque ⇒ Cluster de Sectores. Para el SO la unidad corresponde a 1 Bloque.