# 19/09 - Captura y Acondicionamiento de datos

### ¿Dónde se necesitan especificar distribuciones de probabilidad?

Considere el caso de estudio: Las solicitudes de los clientes que necesitan reparaciones arriban al sector del taller entre *15 a 45 minutos*. Las solicitudes de clientes que requieren armar una bicicleta arriban entre *2 y 4 horas* al sector del taller.

### Especificar distribuciones de probabilidad de entrada.

**¿Cómo pueden determinarse estas distribuciones?** Ya que estas no vienen dadas, hay que analizar para saber a que distribución ajustan los datos.

Una vez que se hayan determinado **¿Cómo hacemos para generar valores de estas distribuciones para llevar a cabo la simulación?**

### Datos vs. Información

Los **datos** pueden ser cuantitativos o cualitativos, solo se transforman en **información** luego de una etapa de procesamiento (ahi realmente se genera conocimiento sobre el dominio).

## Requerimientos de datos

- Datos preliminares / contextuales: Necesarios para comprender la situación problemática y para el modelo conceptual. Por ej: Creencias que se tienen sobre cual puede ser la causa de la problemática, un diagrama layout (similar a diagrama de actividad).
- Datos para la realización del modelo: Para pasar del modelo conceptual a un modelo informático se necesitan muchos datos.
    - Datos deterministas: Tienen valores conocidos y que no cambian.
    - Datos estocásticos: Que varían de manera aleatoria (aunque respondiendo a una distribución)
- Datos para la validación: Se utilizan para garantizar que cada parte del modelo y el modelo en su conjunto representen el sistema del mundo real con suficiente precisión.

## Obtención de datos

Los datos deben ser lo suficientemente precisos y estar en le formato correcto para el modelo de simulación. Existen tres posibilidades.

- Disponible: Conocidos, o han sido recopilados antes. Ej: Cantidad de surtidores.
- No disponible pero coleccionable: Implementar una acción de recopilación de datos, ya sea haciendo que personas o sistemas electrónicos supervisen las operaciones. Ej: Tiempo de arribo de clientes.
- No disponible y no coleccionable: Acontece porque el sistema del mundo real no existe (todavía) o debido a la limitación de tiempo para recopilar datos.
    - Datos estimados: Utilizar datos de sistemas similares para sus estimaciones.
- Tratar los datos como factores experimentales:
    - En lugar.
- Revisar el modelo conceptual.

## Precisión de los datos

### Categoría A

- Investigar fuente de datos. SI los datos se han recopilado para un propósito diferente es posible que ya no se puedan utilizar.
- El pasado no siempre es un buen indicador del futuro.

### Categoría B

- Asegurar que sean lo más precisos posible.
- Asegurar que los datos no estén sesgadas.

### Categoría C

- Las estimaciones deben identificarse claramente en una lista de supuestos.
- Se debe realizar un análisis de sensibilidad sobre estos datos.
- Los datos podrían estar disponibles a medida avance el proyecto.

La informacion a menudo no esta en el formato correcto para la simulacion 

## Representando variabilidad impredecible

Quien modela debe determinar como presentar la variabilidad que esta presente en cada parte del modelo.

### Rastros o trazas

ver en ppt.

### Distribuciones empíricas

ver en ppt.

### Distribuciones estadísticas

Existen tres tipos de distribuciones.

- Distribuciones continuas: Para muestreo de datos que pueden tomar cualquier valor dentro de un rango.
- Para muestreo de datos que pueden tomar solo datos específicos en un rango, por ejemplo
- Distribuciones aproximadas: Utilizadas en ausencia de datos.

## ¿Cómo obtengo datos?

Sugerencias

- Tratar de combinar conjuntos de datos homogeneos.
- Chequear los datos para la homo

## Tratamiento de los datos para ajustar a una distribución de probabilidad

Cantidad de intervalos de clase $\sqrt{N}$ donde $N$ es el tamaño de la muestra