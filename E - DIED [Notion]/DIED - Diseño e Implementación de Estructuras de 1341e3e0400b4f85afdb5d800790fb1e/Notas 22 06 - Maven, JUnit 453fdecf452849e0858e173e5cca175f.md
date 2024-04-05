# Notas 22/06 - Maven, JUnit

- Si tenemos dependencias de otras librerias (Mockito, JUnit, librerias para BDD, para visualización de cosas como grafos…), empieza a haber problemas entre las versiones que tiene cada integrante del equipo instalada.
Maven maneja estas cuestiones. Se declaran todas las cosas que necesita el proyecto para funcionar en un archivo y ahi Maven lo administra automáticamente.
- Gradle es un poco mas compleja, pero compleja. Tiene cierta ventaja en velocidad.