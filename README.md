
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
|Enero|Rural|569.304|455.403|113.901|551.790|430.301|121.489|
|Enero|Urbano|898.964|862.852|36.112|835.788|814.215|21.573|
|Febrero|Rural|626.656|410.149|216.507|632.833|459.234|173.599|
|Febrero|Urbano|873.998|828.550|45.448|865.628|805.478|60.150|
|Marzo|Rural|567.910|466.403|101.507|568.673|436.645|132.028|
|Marzo|Urbano|880.919|862.761|18.158|870.781|818.247|52.534|
|Abril|Rural|709.331|391.934|317.397|610.413|462.077|148.336|
|Abril|Urbano|903.627|840.882|62.745|880.654|806.462|74.192|
|Mayo|Rural|630.139|503.401|126.738|609.699|500.381|109.318|
|Mayo|Urbano|866.233|858.215|80.018|906.951|812.518|94.433|
|Junio|Rural|541.968|406.954|135.014|583.010|383.173|199.837|
|Junio|Urbano|951.109|854.104|97.005|892.279|817.996|74.283|
|Julio|Rural|621.655|448.162|173.493|616.984|418.515|198.469|
|Julio|Urbano|913.083|845.893|67.190|882.306|801.780|80.526|
|Agosto|Rural|616.059|459.452|156.607|631.198|423.065|208.133|
|Agosto|Urbano|929.294|853.104|76.190|882.397|829.671|52.726|
|Septiembre|Rural|608.681|463.259|145.422|578.029|327.678|250.351|
|Septiembre|Urbano|921.875|853.893|67.982|860.870|784.478|76.392|
|Octubre|Rural|609.525|390.738|218.787|592.083|392.151|199.932|
|Octubre|Urbano|894.506|868.393|26.113|869.781|806.524|63.257|
|Noviembre|Rural|539.278|425.787|113.491|553.814|415.529|138.285|
|Noviembre|Urbano|916.759|870.711|46.048|897.987|806.257|91.730|
|Diciembre|Rural|602.854|496.628|106.226|606.253|450.394|155.859|
|Diciembre|Urbano|894.480|859.787|34.693|875.292|798.823|76.469|
|Promedio||753.667|649.333|104.333|735.667|616.733|118.667|

El ingreso laboral promedio para los hombres en el 2019 fue de **753.675** pesos, mientras que para 2018 fue de **735.646** pesos. Esto implica un crecimiento de los ingresos laborales nominales de **2,45%**. Para las mujeres el ingreso laboral promedio para 2019 fue de **649.059** pesos, mientras que para 2018 se encontró en **616.733** pesos. Con un aumento nominal del salario promedio de **5,24%**. Estos datos muestran una brecha salarial entre los hombres y las mujeres. Aunque este resultado disminuyó en 14.296 pesos para 2019 (pasando de 118.913 pesos en 2018 a 104.616 pesos en 2019). 

Dado que se presentan los datos por nivel (urbano y rural) es posible calcular el ingreso promedio por año, genero y mes para zonas urbana y rurales. Tomando unicamente las observaciones por nivel y por año se encuentra que para las zonas urbanas en 2019 los ingresos salariales promedio se encontraron en **879.333** pesos, mientras que para el mismo periodo en las zonas rurales se observo un salario promedio de **523.401** pesos. Se observa una brecha de salarios de **355.932** pesos entre nivel de las observaciones. Para el año 2018 las zonas urbanas presentaron un ingreso laboral promedio de **842.632** pesos, las zonas rurales de **509.747** pesos con una diferencia de **333.885** pesos. Estos resultados empeoran cuando se desagregan por sexo, año y nivel de la observación. Los resultados se muestran en la siguientes tablas:

|Nivel|Hombres 2019|Mujeres 2019|Brecha 2019|Hombres 2018|Mujeres 2018|Brecha 2018|
|-----|------------|------------|-----------|------------|------------|-----------|
|Rural|603.613|443.189|160.424|594.564|424.928|169.636|
|Urbano|903.737|854.928|48.808|876.726|808.537|68.188|

|Nivel|Rural|Urbano|Brecha|
|-----|-----|------|------|
|2019|523.401|879.333|355.931|
|2018|509.746|842.631|332.885|


Los resultados de la tasa de analfabetismo se presentan en el primer [mapa](https://github.com/jorgeluis8ar/Talleres-R/blob/main/Taller%202/Resultados/mapa_analfabetismo.jpeg) para el promedio departamental de 2019. Los resultado de la tasa de graduados de educación superior se presentan en la segunda [mapa](https://github.com/jorgeluis8ar/Talleres-R/blob/main/Taller%202/Resultados/mapa_graduados.jpeg) para el promedio departamental de 2019.


<img src="Taller 2/Resultados/mapa_analfabetismo.jpeg" class="center" alt="drawing" style="width:1000px;"/>
<img src="Taller 2/Resultados/mapa_graduados.jpeg" class="center" alt="drawing" style="width:1000px;"/>

Por último se aprovecha la construcción de la GEIH para presentar la tasa de desempleo mensual desde enero de 2018 hasta diciembre de 2019. Estos resultados se presentan en la [gráfica](https://github.com/jorgeluis8ar/Talleres-R/blob/main/Taller%202/Resultados/desempleo.jpeg). Se observa el periodo con mayore nivele de desempleo en enero de 2019 con un valor de **12,8%** y el menor valor para noviembre de 2018 con un valor de **8,8%**.

<img src="Taller 2/Resultados/desempleo.jpeg" class="center" alt="drawing" style="width:1000px;"/>