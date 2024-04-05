# Introducción / Diagramas Entidad-Relacion

## Etapas de desarrollo de un sistema de información

- Analisis de factibilidad
- Analisis de requerimientos
- Diseño
    - **Diseño de base de datos**
    - Diseño de la aplicación
- Implementación
- Testing

## Etapas en el diseño de una base de datos

### Diseño conceptual

- **DER (Diagrama Entidad-Relacion)**: Se lee el análisis de requerimientos y se reconocen las entidades que deben almacenarse en la base de datos, sus atributos y como están relacionadas entre sí.

### Diseño lógico

- ¿Con que paradigma de diseño de base de datos se trabajara? Hay muchos, pero se trabajará en el cursado con **bases de datos relacionales**.
    - Por su facilidad de utilizar e interpretar su información.
    - Conceptualmente son tablas, físicamente son archivos.
    - Lenguaje estructurado en el que están basadas: SQL.
- Otros tipos: Bases de datos orientadas a objetos, bases de datos objeto-relacionales, bases de datos no relacionales (NoSQL, es un conjunto de paradigmas). Estas ultimas tienen la ventaja de ser más flexibles.
- **DT (Diagrama de tablas):** Las relaciones encontradas en el diseño conceptual se vuelven tablas.

### Diseño físico

- Fuera del scope del curso. En realidad se ven conceptos, pero nada de practica.
- Base de datos implementada. Hay un administrador pensado que datos van en las tablas… “tunea” la base de datos. Cuantos esapcios de tabla, tamaño de bloque (…)

**Lenguaje de Definición de Datos (LDD):** Es un sublenguaje de SQL. Definición de tablas, …

**Lenguaje de manipulación de datos (LMD):** Llenar tablas de datos y manipularlos.

**SQL (Standard Query Language?):** Consultas a la base de datos.

### **Motor de base de datos**

**PostgreSQL**. Es liviana, open source, tiene versión online.

Trabajar con motores distintos de base datos relacionales es muy similar, ya que el standard (SQL) es el mismo.

## DER - Diagrama Entidad-Relación

*Los DER se leen de arriba-abajo e izquierda-derecha.*

### Entidad

Puede ser física o conceptual. Conceptos importantes a almacenar en una BD. Estas poseen atributos y existen relaciones entre ellas. Se simbolizan con un rectangulo.

- Entidades fuertes: Rectangulo de linea simple.
- Entidades debiles: Rectangulo de linea doble. Siempre dependen de una entidad fuerte (dependencia de ciclo de vida, si desaparece entidad fuerte desaparecen las entidades debiles a su dependencia).

### Atributo

Dar mayor detalle a las entidades. Se simbolizan con un ovalo y se unen con una linea a una entidad.

Clasificacion 1:

- Atributos descriptivos: Se emplea para especificar una característica no-única de una instancia de una entidad.
- Atributo identificador: Se trata de un atributo que identifica inequivocamente una entidad fuerte con otras de su mismo tipo. Se simboliza subrayando su nombre con linea simple. Son indispensables.
- Atributo discriminador: Atributo que identifica inequivocamente una entidad debil de otras de su mismo tipo, que dependan de una misma entidad fuerte. Se simboliza subrayando su nombre con linea discontinua.

Clasificación 2:

- Simples.
- Compuestos: Conformado por un conjunto de atributos simples.

Clasificación 3:

- Monovaluado: Se almacena un único valor para ese atributo. Ejs: fecha de nacimiento, nombre, DNI.
- Multivaluados: Pueden tomar multiples valores. Se simbolizan subrayando su nombre con linea doble. **Nota:** **En la diapo estan como ovalos de linea doble** Ejs: nro. de telefono.

Atributos compuestos o multivaluados podrían ser representados como entidades aparte, y ser relacionadas con su correspondiente entidad. Es una decisión de diseño. También aclarar que una entidad sin atributos es un error de diseño, muy posiblemente se trate de un atributo.

Existen también:

- Atributos derivados: Se obtiene como resultado de una operación sobre otros atributos (los detalles de la operación y los operandos no se aclaran en esta etapa). Es “derivado” de otros atributos. Se simboliza con un ovalo con linea discontinua.

### Relación

Asociación entre una o más entidades. Se simbolizan con un rombo.

Un rol es definido como la función que una entidad juega en una relación. Por convención, el rol debe ser un verbo entre dos sujetos que representan a las entidades.

**Grado de una relación:** Numero de entidades asociadas en la relación.

![También existen cuaternarias. De 5 hacia arriba se generalizan a N-arias.](Introduccio%CC%81n%20Diagramas%20Entidad-Relacion%20e94c736fa1054259b44bdac6250c11b1/Untitled.png)

También existen cuaternarias. De 5 hacia arriba se generalizan a N-arias.

**Cardinalidad de una relación:** Indica la cantidad de ocurrencias de cada entidad dentro de la relación. 

![Aclaración: En algunas bibliografías los valores están en sentido contrario.](Introduccio%CC%81n%20Diagramas%20Entidad-Relacion%20e94c736fa1054259b44bdac6250c11b1/Untitled%201.png)

Aclaración: En algunas bibliografías los valores están en sentido contrario.

También se manejan intervalos como cardinalidades, con cardinalidades minimas (existencia) y maximas.

**Atención.** *Cardinalidades en relaciones ternarias hacia arriba… Por ejemplo: En una relación ternaria se considera que una entidad tiene una cardinalidad de 1 si esta está relacionada solo con una instancia de las otras dos entidades asociadas. Capaz pensar: Si consideras en una relación ternaria, un par de instancias de las otras dos entidades, con cuántas. (Igual en la practica se van a poner todas N’s)*

![Untitled](Introduccio%CC%81n%20Diagramas%20Entidad-Relacion%20e94c736fa1054259b44bdac6250c11b1/Untitled%202.png)

**Las relaciones también pueden tener atributos.**

### Extensiones

Los diagramas entidad-relacion se extendieron con conceptos de modelado de objetos. Se suman relaciones de generalización/especialización.

**Herencia**: Atributos y relaciones de entidades padres son heredados por sus entidades hijas. Importante: Para entidades en relaciones de herencia, el atributo identificador corresponde solo a la entidad más alta en el árbol de herencia, para entidades más debajo en el árbol (es decir, que son hijas de otra entidad) se utiliza el atributo discriminador.