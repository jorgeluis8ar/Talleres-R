![GitHub](https://img.shields.io/github/license/jorgeluis8ar/Talleres-R) [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/taller-R/jorgeluis8ar/issues) ![](https://img.shields.io/github/followers/jorgeluis8ar?style=social)

<img src="https://avatars0.githubusercontent.com/u/69487641?s=400&v=4" align="right" width=120 height=120 alt="" />

### Colaboradores ![Powered-taller-R-orange](https://img.shields.io/badge/Powered_by-Taller_R-blue?logo=R)
<a href="https://github.com/jorgeluis8ar/Talleres-R/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=jorgeluis8ar/Talleres-R" />
</a>


# Talleres-R
Este repositorio contiene el desarrollo de los talleres de la clase [Taller de R](https://github.com/taller-R). Los talleres se irán subiendo a su respectiva carpeta debido las fechas pertinentes de entrega. Cada taller cuenta con tres carpetas **1. Resultados**, **2. Scripts** y **3. Data** donde se encuentran gráficas, códigos y bases (procesadas y originales) para cada uno de los respectivos talleres.


El repositorio esta dividido de la siguiente manera:



* [***Taller 1:***](https://github.com/jorgeluis8ar/Talleres-R/tree/main/Taller%201) Introducción a la GEIH y cálculo del desempleo.
  + [***Resultados:***](https://github.com/jorgeluis8ar/Talleres-R/tree/main/Taller%201/Resultados) Resultados taller.
  + [***Scripts:***](https://github.com/jorgeluis8ar/Talleres-R/tree/main/Taller%201/Scripts) Códigos taller.
  + [***Data***](https://github.com/jorgeluis8ar/Talleres-R/tree/main/Taller%201/data) Datos Taller.
  
  
    - [***Junio 2019***](https://github.com/jorgeluis8ar/Talleres-R/tree/main/Taller%201/data/orignal/Junio%202019) Datos GEIH junio 2019.
    
    - [***Junio 2020***](https://github.com/jorgeluis8ar/Talleres-R/tree/main/Taller%201/data/orignal/Junio2%202020) Datos GEIH junio 2020.

## 1. Taller 1 - Introducción a la GEIH

El DANE reportó para el mes de junio de 2020 una **tasa de desempleo** total nacional de **19,81%**, tasa que presentó un aumento de **10.4** puntos porcentuales frente al mismo mes del año anterior (9,4%). Respecto a la **tasa de ocupación**, en el mes de junio de 2020 reportó un valor de **46,1%** presentando una disminución de **11,5** puntos porcentuales frente al mismo mes del año anterior (57,5%).


| Tasa     |Total Nacional  |Total Nacional|Total cabecera|Total cabecera|Total Resto|Total Resto|
|----------|----------------|--------------|--------------|--------------|-----------|-----------|
|          |Junio 2020      |Junio 2019    |Junio 2020    |Junio 2019    |Junio 2020 |Junio 2019 |
|TO (%)    | 45,09          |57,50         |45,38         |57,57         |48,41      |51,52      |
|TD (%)    | 19,81          |9,43          |22,56         |11,39         |9,18cc     |7,99       |

Estos resultados en la tasa de desempleo difieren según la edad de la persona. Específicamente los datos de desempleo son mayores en individuos entre 15-30 años, encontrándose por encima del total nacional. La siguiente gráfica muestra la tasa de desempleo según edad.

<img src="Taller 1/Resultados/tasa de desempleo por edad.jpeg" class="center" alt="drawing" style="width:1000px;"/>


Para junio de 2019 la **Población en Edad de Trabajar** (PET) a nivel nacional fue de **39,293** millones de personas, mientras que para junio de 2020 la PET fue de **39,834** millones de personas. Para el mismo periodo, el número de **personas inactivas** en junio de 2019 llegó a **14,197** millones de personas y en junio de 2020 ascendió a **16,957** millones (aumento de 2,760 millones de personas). Así, la **Población Económicamente Activa** (PEA) llegó en junio de 2019 a **24,975** millones de personas, mientras para el mismo mes de 2020 representó **22,877** millones (disminución de 2,1 millones de personas).


El número de ocupados a nivel nacional para junio de 2019 fue de **22,618** millones de personas, mientras que para el mismo mes de 2020 los ocupados disminuyeron a **18,345** millones de personas (reducción de 4,273 millones de personas). Teniendo en cuenta la dinámica de la PET, la Tasa de Ocupación (TO) del total nacional para junio de 2020 fue de **46,05%**, presentando una reducción de **11,5** puntos porcentuales frente al mismo mes del año anterior (57,5%). Esta disminución se mantiene en los resultados departamentales, pero en algunos casos la disminución es mayor (Bogotá y Magdalena). La siguiente gráfica muestra el comportamiento de la TO por departamento y año.

<img src="Taller 1/Resultados/tasa de ocupacion por depto.jpeg" class="center" alt="drawing" style="width:1000px;"/>


En términos de brecha de género, la TO, el número de ocupados y la PET difieren significativamente entre hombres y mujeres. La TO en junio de 2020 para los hombres se encontró en **57,83%**, mientras que para las mujeres se ubicó en **34,78%** (una diferencia de) 23,05 puntos porcentuales. Para junio de 2019 esta diferencia se ubicó en **21,28** puntos porcentuales. El principal determinante de esta disminución es la caída en el número de ocupados. Entre junio de 2019 y junio de 2020, el número de ocupados para los hombres disminuyó en **1,655** millones de personas, mientras que para las mujeres esta diferencia se ubicó en **2,139** millones de personas. La siguiente tabla resume la dinámica de la tasa de ocupación, número de ocupados y PET por género.

| Estadística                 |Total Nacional - Hombres|Total Nacional - Mujeres |Total Nacional - Hombres|Total Nacional - Mujeres |
|-----------------------------|------------------------|-------------------------|------------------------|-------------------------|
|                             |Junio 2020              |Junio 2020               |Junio 2019              |Junio 2019               |
|Ocupados                     |11.266.743              |7.077.882                |12.922.280              |9.217.717                |
|Población en Edad de Trabajar|19.483.683              |20.350.719               |19.257.583              |20.118.196               |
|Tasa de Ocupación (%)        |57,83                   |34,78                    |67,10                   |45,82                   |

La siguiente gráfica muestra la tasa de ocupación según grupo de edad y genero. Se observa la diferencia entre junio de 2019 y junio de 2020, pero aún más importante se evidencia la constante brecha en la tasa de ocupación entre hombres y mujeres. Es importante notar que esta diferencia se mantiene en ausencia de distorsiones laborales como el COVID-19.

<img src="Taller 1/Resultados/tasa de ocupacion por genero y edad.jpeg" class="center" alt="drawing" style="width:1000px;"/>


En términos de Tasa de Desempleo (TD), el número de desocupados, el numero de inactivos y la PEA difieren significativamente entre hombres y mujeres. La TD en junio de 2020 para los hombres se encontró en **16,23%**, mientras que para las mujeres se ubicó en **24,93%** (una diferencia de) 8,695 puntos porcentuales. Para junio de 2019 esta diferencia se ubicó en **4,983** puntos porcentuales. Los principales determinantes de este aumento se dan por incrementos en el número de desocupados e inactivos. Entre junio de 2019 y junio de 2020, el número de hombres desocupados aumentó en **971** mil personas, mientras que para las mujeres esta diferencia se ubicó en **904** mil personas. El número de hombres inactivos aumentó entre junio 2019 y junio 2020 en **910** mil personas. Para las mujeres, el número de personas inactivas se incrementó en **1,468** millones de personas. La siguiente tabla resume la dinámica de la tasa de desempleo, número de inactivos y desocupados por género.

| Estadística                   |Total Nacional - Hombres|Total Nacional - Mujeres |Total Nacional - Hombres|Total Nacional - Mujeres |
|-------------------------------|------------------------|-------------------------|------------------------|-------------------------|
|                               |Junio 2020              |Junio 2020               |Junio 2019              |Junio 2019               |
|Desocupados                    |2.182.820               |2.349.911                |1.211.742               |1.445.556                |
|Población Económicamente Activa|13.449.563              |9.427.793                |14.134.021              |10.663.273               |
|Tasa de Desempleo (%)          |16.23                   |24,93                    |8,57                    |13,56                    |

La siguiente gráfica muestra la tasa de desempleo según grupo de edad y genero. Se observa la diferencia entre junio de 2019 y junio de 2020, pero aún más importante se evidencia la constante brecha en la tasa de desempleo entre hombres y mujeres. Es importante notar que esta diferencia se mantiene en ausencia de distorsiones laborales como el COVID-19. También se observa que estas diferencias se reducen y las tasas de desempleo entre hombres y mujeres tienden a disipar sus diferencias.

<img src="Taller 1/Resultados/tasa de desempleo por genero y edad.jpeg" class="center" alt="drawing" style="width:1000px;"/>