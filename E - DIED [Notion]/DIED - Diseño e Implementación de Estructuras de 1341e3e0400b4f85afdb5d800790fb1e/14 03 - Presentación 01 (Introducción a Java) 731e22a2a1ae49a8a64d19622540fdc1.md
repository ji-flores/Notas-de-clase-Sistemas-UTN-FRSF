# 14/03 - Presentación 01 (Introducción a Java)

## Java: Algunas características

- Java es un lenguaje orientado a objetos. Desde un enfoque estático, programar en Java es escribir clases, atributos, métodos y relaciones entre las clases. Desde un enfoque dinámico, ejecutar un programa en Java implica crear instancias de objetos, relacionarlos e invocar sus métodos.

*Buena practica en POO: Es más importante pensar en métodos que en los atributos/variables. Pensar en las responsabilidades y “quién puede hacer qué cosa”, y en base a eso definir donde va cada método y que clase posee que atributo.*

- Es compilado e interpretado.
- Independiente de la plataforma. (?)
- (Hasta el momento) es un lenguaje fuertemente tipado: Toda variable debe ser declarada con un tipo de datos, obligatoriamente.
- API muy extensa de funciones y clases predefinidas.
- Soporta conceptos de programación funcional.
- Gestión automática de memoria (no es necesario usar malloc, delete, etc…).

## Ejecutar un programa Java

- Para ejecutar un programa Java: Descargar el runtime de ejecución JRE (Java Runtime Enviroment) o JVM (Java Virtual Machine).
- Para escribir un programa en Java: Instalar el kit de herramientas de desarrollo

(más en diapositiva)

Version recomendada de Java: 17 (LTS)

OpenJDK

- Cada clase esta en su propio archivo, cuyo nombre debe coincidir con la clase que contiene.
- Crear un archivo, con la convención de nombre anterior mencionada, la extensión es .java.
- Este archivo, para poder ser ejecutado, deben ofrecer un método denominado “main” con la siguiente firma: `public static void main(String[] args)`.