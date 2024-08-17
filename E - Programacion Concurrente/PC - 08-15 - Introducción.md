# Programación Concurrente - Introducción

## Introducción

![image](https://github.com/user-attachments/assets/96719040-6b7d-4acc-8428-96b365967a10)


## ¿Por qué concurrencia?

![image](https://github.com/user-attachments/assets/412e93f5-b407-422a-a975-762ec85fb90e)

## Terminología

+ Procesos: Programa secuencial que ejecuta en su propio espacio de direcciones.
+ Threads: Ejecuta dentro del espacio de direcciones de un único proceso.
+ Estado: Datos + Puntero de instrucción.
+ *Scheduler*: Un programa del SO que decide cual es el proceso que debe ejecutar en el próximo intervalo de tiempo. Nos vamos a abstraer de ese programa.

## Solución concurrente

*Nota: Hay un ejemplo atras.*

No vamos usar la administración del tiempo al diseñar algoritmos concurrentes.

## Procesos independientes

+ Def.: Procesos que no se afectan uno a otro, no comparten recursos ni hay comunicación entre ellos.
+ La concurrencia no se interesa en ellos.

## Procesos competitivos

+ Compiten por recursos.

![ejemplo](https://github.com/user-attachments/assets/f49ac355-c65c-4f7a-a48a-c264e78e96ba)

## Procesos cooperativos

Se busca transformar la competencia en cooperación. Se necesitan mecanismos de comunicación/coordinación/sincronización para que pueda lograrse una cooperación.

¿Cuales son estos mecanismos para lograr una correcta comunicación?

+ No puede considerarse la velocidad de ejecución como variable para sincronizar los procesos.

## Memoria compartida

+ No determinismo instrínseco.
+ Interacción/comunicación
+ El resultado no siempre es "interesante" (importan los programas que no terminan).

## Contenidos
+ Memoria compartida.
  + Exclusión mutua, Algoritmos de exclusión mutua (Dekker, Bakery).
  + Problemas clasicos: Filosofos comensales, Lectores/Escritores.
  + Estructuras de datos concurrentes y programación libre de locks.
+ Intercambio de mensajes en Java.
  + Comunicación sincronica.
  + Comunicación asincronica.
+ Modelo de actores (Erlang).

### Bibliografía

![bibliografia](https://github.com/user-attachments/assets/c345724e-ed43-4170-ae21-40d6bc8a3f80)
