# Modelo de Computo

## Programa Concurrente
![image](https://github.com/user-attachments/assets/9dd8fcc0-04e0-42bc-b522-074a3cbd16fb)

## Estado (y transiciones) de un proceso

![image](https://github.com/user-attachments/assets/5fd5286b-6393-4146-9a1f-b73ceb7adaee)

...

## Algoritmo III

+ No hay garantía de entrada. Cuando T0 termina la sección critica le da el turno a T1, pero hasta que T1 no ejecute su sección critica no va a poder entrar de vuelta a su propia sección critica. T1 esta evitando que T0 entre a la RC sin estar él mismo en la RC, y si ademas consideramos que T1 puede tener una sección no critica "infinita", T0 nunca va a poder entrar a su RC.
