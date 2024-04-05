# 16/08 - Diagramas de Forrester (Modelado Cuantitativo)

## Diagramas de stock-flujo

**Variables…**

- **de Estado/de Nivel:** Representan las magnitudes que determinan su variación a lo largo del tiempo. Son las más importantes.
    - En diagramas de Forrester, son aquellas que nos muestran en cada instante la situación del modelo, presentan una acumulación y varían solo en función de otros elementos denominados flujos.
- **de Flujo:** Se encuentran asociadas a las de estado. Siempre las var. de Estado tienen asociadas este tipo de variables.
    - En diagramas de Forrester, son elementos que pueden definirse como funciones temporales, recogen…
- **Auxiliares:** Representan pasos intermedios para la determinación de las variables de flujos a partir de las variables de estado.
    - En diagramas de Forrester, junto con las constantes, son parámetros que refinan el comportamiento de los flujos.

![Untitled](16%2008%20-%20Diagramas%20de%20Forrester%20(Modelado%20Cuantitat%20acf70f79ec044de39d465bc18322be13/Untitled.png)

**Canal material:** Trasmiten las magnitudes físicas entre flujos y niveles.

**Canal de información:** Transmiten información, que por su naturaleza no se conserva.

**Nubes:** Son fuentes de contenido inagotable.

![Untitled](16%2008%20-%20Diagramas%20de%20Forrester%20(Modelado%20Cuantitat%20acf70f79ec044de39d465bc18322be13/Untitled%201.png)

## Pautas para el modelado

- Un **flujo** admite como señal de **entrada**, la información proveniente de los **estados** o de las **var. auxiliares** y suministra como **salida** el flujo que alimenta a un **estado**.
- A todo **estado** se le asocia **una o más** variables de **flujo**.
- Una variable de **flujo** vendrá **medida** por la **unidad** del **estado** al que alimenta, sobre el **tiempo**. **Ej:** $/s, m/s, km/h. Nótese que siempre es sobre tiempo.
- Dos variables de **flujo** solo pueden conectarse por medio de un **canal de información**.
- Una variable de **estado** no puede influir directamente a otra variable de **estado**, sino a través del **flujo** que proporcione la primera.

## Traducción de Diagrama Causal a Forrester

Del diagrama causal tenemos:

- Lo que va de **flujo a nivel** es **canal material**.
    - Si es **positivo** es de **entrada.**
    - Si es **negativo** es de **salida**.
- Si va de **nivel a flujo** es **canal de información**.

---

### **“Tarea”**

- ¿Cuáles son las limitaciones de los diagramas de Flujo? Teniendo en cuenta de que es un diagrama *cualitativo*
- ¿Cuáles son las limitaciones de los diagramas de Forrester?

---

- Debe de plantearse una ecuación diferencial por cada **variable de estado**.
- También es necesario plantear un estado inicial para cada una de las var. de estado.

Pasos del modelado

- Identificación de variables.
- Diagrama causal
- Diagrama estructural o de Forrester, con todos sus elementos. Respetar las reglas de modelado.
- Planteo de las ecuaciones diferenciales. En general son muy simples, planteando:
    
    $$
    \frac{d\text{Estado}}{dt}=\text{FlujoIn}_1+...+\text{FlujoIn}_n -\text{FlujoOut}_1-...-\text{FlujoOut}_m
    $$
    
    Vensim generalmente genera estas ecuaciones automáticamente.