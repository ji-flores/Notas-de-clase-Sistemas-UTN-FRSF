# Metricas de SW (cont.)

## Beneficios de las metricas

+ Comunicación basada en hechos reales. Justificación de cambios.
+ Identificación (temprana) de problemas y riesgos.
+ Seguimiento o control de objetivos.
+ En general, soporte de decisiones.

## Metricas de proceso

+ Garantizar que los procesos definidos estan siendo considerados.
+ Evaluar si los procesos se estan llevando adelante segun lo esperado.
+ Implementar mejoras de manera de lograr objetivos de negocio.
+ Ejemplos:
    + Nivel de satisfaccion del cliente con productos desarrollados con determinado proceso.
    + Exactitud de estimación de recursos (tiempo, plata, ...)

## Normas basicas de interpretacion

+ Utilizar sentido comun para interpretar, y establecer metricas claras.
+ No utilizar para evaluar personas, ni amenazar particulares o equipos.
+ Si una métrica identifica un area problematica no se debería considerar algo negativo. De hecho es muy positivo.

## Metricas de proyecto

+ Primera interpretacion de las metricas de proyecto -> Estimación.
+ A medida que avanza el proyecto, las medidas de esfuerzo y tiempo se comapran con las de planificación.
+ Supervisar y controlar el avance del proyecto.
+ Ejemplos:
    + Tiempo y esfuerzo medios de correción de errores.
    + \# defectos detectados antes de la entrega de SW.
    + \# fallas detectadas e informadas por los usuarios finales.
    + \# productos de trabajo entregados.
    + % requerimientos implementados.

La utilidad de las metricas del proyecto son avanzar optimizando la planificación y evaluando la calidad de los productos.

## M. de proceso vs. de proyecto

+ Tecnicamente no gran diferencia. M. de proceso pueden concebirse como recopilaciones de métricas de proyecto.
+ De proceso son estrategicas (largo plazo), de proyecto son tácticas (corto plazo).
+ Muchas metricas se repiten en ambos dominios.

## Metricas de producto

+ Asegurar la aceptación del cliente.
+ Cuestiones más importantes.
    + Relativas a atributos del producto (arquitectura, productividad, confiabilidad...).

## Lineas de codigo

Las lineas de codigo no te dicen nada en si (no dicen nada sobre calidad, depende del LdP, comentarios...), pero se usan para normalizar metricas.

Se usan porque son comunes a cualquier proceso de SW y son faciles de medir.

## Metricas orientadas a la funcionalidad

+ Valor de normalización basado en funcionalidad entregada por la aplicación.
+ Metrica: PF (Punto de funcion)
+ Independiente del LdP.
+ Se pueden conocer temprano en el proyecto (puntos de casos de uso, puntos de historia, dependiendo del modelo de ciclo de vida).

## Paradigma GQM

+ Fundamento: "Medición basada en modelos y objetivos".

Definición GQM:

+ Goals: Aquello que la organización o proyecto quieren alcanzar. Se define un objetivo para una entidad.
    + Ej: Mejorar la productividad de los programadores, reducir tiempos de desarrollo, incrementar la confiabilidad.
+ Questions: Refinamientos de las metas en las que se identifican áreas especifican de incertidumbre.
    + Ej: Productividad. ¿Como se puede incrementar el # de LDC depuradas?. Confiabilidad ¿Como llevar a cabo evaluaciones...
+ Metrics: Mediciones necesarias para ayudar a responder las preguntas y confirmar si las mejoras del proceso o proyecto cumplieron su objetivo.

### Otra propuesta de pasos GQM

1. Pensar entidades relacionadas a la meta.
2. Generar preguntas para cada entidad, relacionadas a la meta.
3. Agrupar preguntas en areas y submetas (que no sean las entidades).
4. Subentidades y atributos (por submeta o area).
5. Métricas.

## Métricas públicas vs. privadas

(...)

## ISO/IEC 15939-2022

(...)

