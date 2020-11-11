
![GitHub](https://img.shields.io/github/license/jorgeluis8ar/Talleres-R) [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/taller-R/jorgeluis8ar/issues) ![](https://img.shields.io/github/followers/jorgeluis8ar?style=social)

<img src="https://avatars0.githubusercontent.com/u/69487641?s=400&v=4" align="right" width=120 height=120 alt="" />

### Colaboradores ![Powered-taller-R-orange](https://img.shields.io/badge/Powered_by-Taller_R-blue?logo=R)
<a href="https://github.com/jorgeluis8ar/Talleres-R/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=jorgeluis8ar/Talleres-R" />
</a>


# Talleres-R
Este repositorio contiene el desarrollo de los talleres de la clase [Taller de R](https://github.com/taller-R). Los talleres se irán subiendo a su respectiva carpeta debido las fechas pertinentes de entrega. Cada taller cuenta con tres carpetas **1. Resultados**, **2. Scripts** y **3. Datos** donde se encuentran gráficas, códigos y bases (procesadas y originales) para cada uno de los respectivos talleres.


El repositorio esta dividido de la siguiente manera:



* [***Taller 2:***](https://github.com/jorgeluis8ar/Talleres-R/tree/main/Taller%202) Introducción a la GEIH y cálculo del desempleo.
  + [***Resultados:***](https://github.com/jorgeluis8ar/Talleres-R/tree/main/Taller%202/Resultados) Resultados taller.
  + [***Scripts:***](https://github.com/jorgeluis8ar/Talleres-R/tree/main/Taller%202/Scripts) Códigos taller.
  + [***Datos***](https://github.com/jorgeluis8ar/Talleres-R/tree/main/Taller%202/Datos) Datos Taller.
  
  
    - [***GEIH 2019***](https://github.com/jorgeluis8ar/Talleres-R/blob/main/Taller%202/Datos/GEIH%202018.zip) Datos GEIH 2018.
    
    - [***GEIH 2020***](https://github.com/jorgeluis8ar/Talleres-R/blob/main/Taller%202/Datos/GEIH%202019.zip) Datos GEIH 2020.

## 1. Taller 2 - GEIH y algunas estadísticas

El DANE reporta para en la Gran Encuesta Integrada de Hogares (**GEIH**) variables relacionadas sobre las condiciones de empleo de las personas. De esta manera se puede desagregar resultados por departamento, mes y año para las variables de interés. Para este taller se utilizan principalmente las variables para características como el **analfabetismo**, **educación superior** e **ingresos laborales** de las personas. COn esto en mente, el siguiente análisis desagrega estas variables por año, mes, sexo y nivel  (urbano o rural).

En términos de la tasa de desempleo se encuentra un promedio nacional de **11,423%** en 2018 y **11,235%** en 2019. Los departamento con mayor tasa de analfabestismo son Chocó (21,009%), La Guajira (18,657%), Magdalena (14,139%) y Córdoba (14,614%) en 2019. La columna 3 de la siguiente tabla muestra el crecimiento de la tasa de analfabetismo entre 2018 y 2019. Los datos muestran que Bogotá (10,511%), Risaralda (7,688%) y Nariño (4,531%) presentaron los mayores incrementos, mientras Bolívar (-11,144%), Cesar (-8,055%), Sucre (-7,566%) y Huila (-7,478%) presentaron las mayores disminuciones en el periodo analizado.


|Departamento|Tasa de analfabetismo 2018|Tasa de analfabetismo 2019|Crecimiento analfabetismo (%)|Tasa graduados educación superior 2018|Tasa graduados educación superior 2019|Crecimiento graduados eduación superior (%)|
|---------|-----|-------|---|---|---|---|
|Antioquia|9,094|9,217|1,352|7,232|7,639|5,627|
|Atlantico|8,679|8,888|2,408|7,88|8,01|1,649|
|Bogota D.C|5,537|6,119|10,511|13,344|13,438|0,704|
|Bolivar|12,805|11,378|-11,144|5,218|5,466|4,752|
|Boyaca|9,081|8,638|-4,878|7,01|7,297|4,094|
|Caldas|9,214|8,958|-2,778|6,394|6,373|-0,328|
|Caqueta|13,19|12,412|-5,898|3,92|4,136|5,51|
|Cauca|10,147|10,664|5,095|4,514|4,355|-3,522|
|Cesar|13,867|12,75|-8,055|4,726|5,229|10,643|
|Cordoba|14,371|14,614|1,69|4,9|5,376|9,714|
|Cundinamarca|7,991|7,698|-3,666|4,726|5,33|12,78|
|Choco|22,154|21,009|-5,168|4,525|4,772|5,458|
|Huila|11,634|10,764|-7,478|5,453|5,334|-2,182|
|La Guajira|18,348|18,657|1,684|4,75|5,437|14,463|
|Magdalena|14,269|14,139|-0,911|5,015|4,599|-8,295|
|Meta|9,205|9,423|2,368|5,672|6,035|6,399|
|Nariño|11,365|11,88|4,531|5,483|6,329|15,429|
|N. Santander|11,62|11,902|2,426|4,616|4,831|4,657|
|Quindio|9,75|9,363|-3,969|5,777|6,193|7,2|
|Risaralda|8,688|9,356|7,688|5,601|5,627|0,464|
|Santander|8,222|8,239|0,206|7,54|7,343|-2,612|
|Sucre|15,992|14,782|-7,566|4,771|5,235|9,725|
|Tolima|10,674|10,248|-3,991|4,958|5,506|11,052|
|V. Cauca|8,263|8,545|3,412|6,592|6,636|0,667|
|Promedio Nacional|11,423|11,235|-0,922|5,859|6,105|4,752|

En términos de la tasa de graduados de eduación superior se encuentra un promedio nacional de **5,859%** en 2018 y **6,105%** en 2019. Los departamento con mayor tasa de graduados de educación superior son Bogotá (13,438%), Atlántico (8,010%), Antioquia (7,639%) y Santander (7,343%) en 2019. La columna 3 de la siguiente tabla muestra el crecimiento de la tasa de analfabetismo entre 2018 y 2019. Los datos muestran que Nariño (15,429%), La Guajira (14,463%) y Cundinamarca (12,780%) presentaron los mayores incrementos, mientras Magdalena (-8,295%), Cauca (-3,522%), Santander (-2,612%) y Huial (-2,182%) presentaron las mayores disminuciones en el periodo analizado.

Los resultados de la tasa de analfabetismo se presentan en la primera [gráfica](https://github.com/jorgeluis8ar/Talleres-R/blob/main/Taller%202/Resultados/analfabetismo.jpeg) para el promedio departamental de 2019. Los resultado de la tasa de graduados de educación superior se presentan en la segunda [gráfica](https://github.com/jorgeluis8ar/Talleres-R/blob/main/Taller%202/Resultados/educacion.jpeg) para el promedio departamental de 2019.

<img src="Taller 2/Resultados/analfabetismo.jpeg" class="center" alt="drawing" style="width:1000px;"/>
<img src="Taller 2/Resultados/educacion.jpeg" class="center" alt="drawing" style="width:1000px;"/>


Por último se obtienen los ingresos laborales para las personas entre 18 y 28 años por departamento, mes, sexo y sexo. Los resultados se presentan en la siguiente tabla:


|Mes|Nivel|Hombres 2019|Mujeres 2019|Brecha 2019|Hombres 2018|Mujeres 2018|Brecha 2018|
|---|-----|------------|------------|-----------|------------|------------|-----------|
|Enero|Rural|Hombres 2019|455.403|113.901|551.790|430.301|121.489|
|Enero|Urbano|Hombres 2019|862.852|36.112|835.788|814.215|21.573|
|Febrero|Rural|Hombres 2019|410.149|216.507|632.833|459.234|173.599|
|Febrero|Urbano|Hombres 2019|828.550|45.448|865.628|805.478|60.150|
|Marzo|Rural|Hombres 2019|466.403|101.507|568.673|436.645|132.028|
|Marzo|Urbano|Hombres 2019|862.761|18.158|870.781|818.247|52.534|
|Abril|Rural|Hombres 2019|391.934|317.397|610.413|462.077|148.336|
|Abril|Urbano|Hombres 2019|840.882|62.745|880.654|806.462|74.192|
|Mayo|Rural|Hombres 2019|503.401|126.738|609.699|500.381|109.318|
|Mayo|Urbano|Hombres 2019|858.215|80.018|906.951|812.518|94.433|
|Junio|Rural|Hombres 2019|406.954|135.014|583.010|383.173|199.837|
|Junio|Urbano|Hombres 2019|854.104|97.005|892.279|817.996|74.283|
|Julio|Rural|Hombres 2019|448.162|173.493|616.984|418.515|198.469|
|Julio|Urbano|Hombres 2019|845.893|67.190|882.306|801.780|80.526|
|Agosto|Rural|Hombres 2019|459.452|156.607|631.198|423.065|208.133|
|Agosto|Urbano|Hombres 2019|853.104|76.190|882.397|829.671|52.726|
|Septiembre|Rural|Hombres 2019|463.259|145.422|578.029|327.678|250.351|
|Septiembre|Urbano|Hombres 2019|853.893|67.982|860.870|784.478|76.392|
|Octubre|Rural|Hombres 2019|390.738|218.787|592.083|392.151|199.932|
|Octubre|Urbano|Hombres 2019|868.393|26.113|869.781|806.524|63.257|
|Noviembre|Rural|Hombres 2019|425.787|113.491|553.814|415.529|138.285|
|Noviembre|Urbano|Hombres 2019|870.711|46.048|897.987|806.257|91.730|
|Diciembre|Rural|Hombres 2019|496.628|106.226|606.253|450.394|155.859|
|Diciembre|Urbano|Hombres 2019|859.787|34.693|875.292|798.823|76.469|



<img src="Taller 2/Resultados/mapa_analfabetismo.jpeg" class="center" alt="drawing" style="width:1000px;"/>
<img src="Taller 2/Resultados/mapa_graduados.jpeg" class="center" alt="drawing" style="width:1000px;"/>

<img src="Taller 2/Resultados/desempleo.jpeg" class="center" alt="drawing" style="width:1000px;"/>