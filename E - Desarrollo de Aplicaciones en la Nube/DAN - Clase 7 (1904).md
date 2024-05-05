# Bean (cont.)

Una ventaja de Bean es que, si tiene que inyectar clases de Servicios, que generalmente no tienen estado, no genera una instancia nueva por cada llamada, sino que inyecta la misma instancia muchas veces.

No necesariamente se pueden configurar Beans por archivo, se pueden crear clases anotadas como @Configuration que tendrán metodos anotados con @Bean que hacen esas instanciaciones.