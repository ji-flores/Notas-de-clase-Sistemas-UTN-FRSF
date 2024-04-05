# Modelo Relacional

## Bases de Datos Relacionales (BDR)

Los datos se presentan al usuario como tablas:

![Untitled](Modelo%20Relacional%20f990e5e9ef774104a963513a9f685cb5/Untitled.png)

![Untitled](Modelo%20Relacional%20f990e5e9ef774104a963513a9f685cb5/Untitled%201.png)

- Las tablas son la estructura lógica de una BD Relacional, no su estructura física. La estructura física constará de archivos (secuenciales, indexados, hash), índices, etc.
- No hay punteros. La información en las BD esta representada como valores de datos explícitos.
- Los operadores para la recuperación de datos son operadores que generan nuevas tablas a partir de las tablas existentes.
- Datos y propiedades importantes:
    - No deben existir filas duplicadas.
    - Cada fila tiene una clave (key) que la representa unívocamente.
    - Ni las filas (o **tuplas**) ni atributos (**columnas**) tienen un orden definido.
    - Los valores de los atributos son atómicos.
    - Dominio: Es el conjunto de valores desde el cual un atributo puede tomar el valor actual.
    - Se agregan y eliminan solo filas. Las columnas solo pueden actualizarse (modificarse).

## Claves

Ninguna tabla de una BDR ****puede prescindir de una clave.

El/los atributo/s que distinguen univocamente una ocurrencia de una entidad de la otra se denomina **superclave**.

Propiedades de una **clave**:

- **Unicidad**: Dos tuplas distintas no pueden tener el mismo valor de clave. ****
- **Irreducibilidad**: Ningún subconjunto de la clave candidata conserva la propiedad de unicidad. Coloquialmente, quitarle una de las partes a la clave hace que pierda la condición de unicidad.

![**Claves candidatas:** Aquellas superclaves en la que ningún subconjunto de ella es superclave (a, b y c).](Modelo%20Relacional%20f990e5e9ef774104a963513a9f685cb5/Untitled%202.png)

**Claves candidatas:** Aquellas superclaves en la que ningún subconjunto de ella es superclave (a, b y c).

Si $K$ es una superclave también lo será cualquier superconjunto de $K$.

*Basicamente una superclave cumple con unicidad pero no necesariamente con irreducibilidad.*

### Claves primarias

**Def:** La clave que el diseñador de la BD elige entre el conjunto de claves candidatas como medio principal para identificar las entidades en el conjunto de entidades. ***Dato:** Se prefieren, siempre que se pueda, claves simples a claves compuestas.*

### Claves foráneas

**Def:** Dada una tabla base R2, una clave foránea en R2 es un subconjunto FK de atributos de R2 tal que:

- Existe una tabla R1 con una clave candidata CK.
- En todo momento cada valor de FK en R2 es idéntico a algún valor de CK en R1.

Establecen relaciones entre tablas.

### Entidades débiles

Las **entidades débiles** son aquellas que no cuentan con un conjunto de atributos propios para formar una clave primaria.

### **Valores nulos**

En una BDR se pueden especificar restricciones en las que se permiten valores nulos o no para un atributo. Un valor nulo por lo general indica desconocimiento de la información. Por ej: Fecha de nacimiento desconocida.
Por lo general **se prohíbe que algún componente de clave primaria contenga valores nulos.** Tampoco en claves foráneas en relaciones que son obligatorias. Se permiten en los otros casos pero se deben emplear con cuidado.

## Equivalencia DER → Modelo Relacional

### Entidades

- Las **entidades fuertes** se traducen en **tablas**.
- **Entidades débiles.** Se traducen en tablas, como por definición no tienen clave primaria “propia”, su clave primaria será `{PK de la entidad fuerte a la que está relacionada, Atributo discriminador}` . PK de la entidad fuerte es la clave foránea que la relaciona con la tabla correspondiente a dicha entidad fuerte. La relación correspondiente a la entidad debil no se transforma.

### Atributos

Los **atributos** de una entidad se traducen en columnas de la correspondiente tabla.

- El **atributo identificador** se indica subrayado con línea continua y será la **clave primaria** de la tabla.
- **Atributos multivaluados** se traducen en **tablas**.
    - A esta tabla se le agrega como atributo la clave primaria de la tabla de la entidad (a la que pertenece el atributo): `PK_Entidad`.
    - Esta tabla tiene como clave primaria el conjunto `{PK_Entidad, Atributo}`
    - `PK_Entidad` es también una **clave foránea** que sirve para relacionar la tabla del atributo con la tabla de la entidad.
- **Atributos compuestos:** Simplemente se agregan como columnas todos los atributos simples que estén bajo un atributo compuesto.

### **Relaciones**

- **Binarias, 1 a 1:**  Suponer que se relacionan entidades A y B. En la tabla A se agrega una columna que replica la clave primaria de B, y servirá como clave foránea que establecerá una relación con la tabla B.
    - Si ambos lados de la relacion son opcionales u obligatorios, se elige cualquiera de las dos como “tabla A”. Si uno es obligatorio y el otro no, “tabla A” es la entidad que es obligatoria en la relación.
    - Si alguna de las PK es compuesta se replican tantas columnas como atributos conformen dicha PK.
- **Binarias, 1 a N:**  La tabla A corresponde a la entidad del “lado N” y B a la otra. En la tabla A se agrega una columna que replica la clave primaria de B, y servirá como clave foránea que establecerá una relación con la tabla B *(mismo procedimiento que el item anterior)*.

Si una relación de estos últimos dos tipos tiene atributos, se agregan como atributos en la tabla A.

También es posible traducirlas como tablas, pero no es lo más común.

- **Binarias, N a N**: Se traducen en **tablas**.
    - Su PK es el conjunto formado por las PK de las entidades involucradas en la relación.
    - Cada una de las PK de las entidades involucradas son claves foráneas que relacionan la tabla de la relación con las tablas de las entidades involucradas.
    - Si la relación tiene atributos, naturalmente son columnas de la tabla.
- **N-arias:** Idem a las relaciones **Binarias, N a N**.

### Generalización/Especialización

Tres diferentes maneras:

**Modelo plano**

Todas las entidades que son del supertipo tienen todos los atributos de todos los subtipos, y ademas se agrega un atributo de “tipo”. Naturalmente, si una entidad es del subtipo “A”, los atributos que correspondan al subtipo que no sea “A” van a ser NULL.

![Untitled](Modelo%20Relacional%20f990e5e9ef774104a963513a9f685cb5/Untitled%203.png)

**Modelo vertical**

Se hacen tablas separadas para el supertipo y los subtipos. Las tablas del supertipo tienen los datos del supertipo, y las tablas de los subtipos tienen los atributos del subtipo MÁS el artibuto identificador del supertipo como PK , y ademas como FK a la tabla del supertipo.

![Untitled](Modelo%20Relacional%20f990e5e9ef774104a963513a9f685cb5/Untitled%204.png)

**Modelo horizontal**

Basicamente desaparece la herencia, todos los datos del supertipo se repiten en cada uno de los subtipos.

![Untitled](Modelo%20Relacional%20f990e5e9ef774104a963513a9f685cb5/Untitled%205.png)