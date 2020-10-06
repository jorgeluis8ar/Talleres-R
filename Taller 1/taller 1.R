# Codigo creado por: Jorge Luis Ochoa Rincon
# Codigo: 201711018
# Taller de R - Task 1

# Limpiando la consola

cat("\f")
rm(list=ls())
options("scipen"=100, "digits"=4)
setwd("/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres-R")

paquetes=c("tidyverse","data.table","ggplot2")

lapply(paquetes,require,character.only=T)
source("taller 1/functions.R") 

file_archivos <- list.files("Taller 1/data/orignal/Junio 2019") %>% paste0("Taller 1/data/orignal/Junio 2019/",.)
lista_2019 = lapply(file_archivos,function(x) geih(path_file = x)) 
cg_2019_cabecera = lista_2019[1] %>% as.data.frame()
cg_2019_resto = lista_2019[6]  %>% as.data.frame()
lista_2019 = lista_2019[-1]
lista_2019 = lista_2019[-5]
for (n in 1:8){
    if (n==1 ){
      de_2019_cabecera = lista_2019[n] %>% as.data.frame()
    } 
    if (n==2 ){
      ft_2019_cabecera = lista_2019[n] %>% as.data.frame()
    } 
    if (n==3 ){
      in_2019_cabecera = lista_2019[n] %>% as.data.frame()
    } 
    if (n==4 ){
      oc_2019_cabecera = lista_2019[n] %>% as.data.frame()
    } 
    if (n==5 ){
      de_2019_resto = lista_2019[n] %>% as.data.frame()
    } 
    if (n==6 ){
      ft_2019_resto = lista_2019[n] %>% as.data.frame()
    } 
    if (n==7 ){
      in_2019_resto = lista_2019[n] %>% as.data.frame()
    } 
    if (n==8 ){
      oc_2019_resto = lista_2019[n] %>% as.data.frame()
    } 
  }


cabecera2019 = merge(x = cg_2019_cabecera , y = de_2019_cabecera , by = c('directorio','secuencia_p','orden'), all.x = T )  
cabecera2019 = merge(x = cabecera2019 , y = ft_2019_cabecera , by = c('directorio','secuencia_p','orden'), all.x = T )
cabecera2019 = merge(x = cabecera2019 , y = in_2019_cabecera , by = c('directorio','secuencia_p','orden'), all.x = T ) 
cabecera2019 = merge(x = cabecera2019 , y = oc_2019_cabecera , by = c('directorio','secuencia_p','orden'), all.x = T )
cabecera2019$periodo=2019

cabecera2019 %>% summarise(total=sum(fex_c_2011))

resto2019 = merge(x = cg_2019_resto , y = de_2019_resto , by = c('directorio','secuencia_p','orden'), all.x = T )  
resto2019 = merge(x = resto2019 , y = ft_2019_resto , by = c('directorio','secuencia_p','orden'), all.x = T )
resto2019 = merge(x = resto2019 , y = in_2019_resto , by = c('directorio','secuencia_p','orden'), all.x = T ) 
resto2019 = merge(x = resto2019 , y = oc_2019_resto , by = c('directorio','secuencia_p','orden'), all.x = T )
resto2019$periodo=2019

resto2019 %>% summarise(total=sum(fex_c_2011))

file_archivos <- list.files("Taller 1/data/orignal/Junio2 2020") %>% paste0("Taller 1/data/orignal/Junio2 2020/",.)
lista_2020 = lapply(file_archivos,function(x) geih3(path_file = x))
cg_2020_cabecera = lista_2020[1] %>% as.data.frame()
cg_2020_resto = lista_2020[6] %>% as.data.frame()
lista_2020 = lista_2020[-1]
lista_2020 = lista_2020[-5] 
for (n in 1:8){
  if (n==1 ){
    de_2020_cabecera = lista_2020[n] %>% as.data.frame()
  } 
  if (n==2 ){
    ft_2020_cabecera = lista_2020[n] %>% as.data.frame()
  } 
  if (n==3 ){
    in_2020_cabecera = lista_2020[n] %>% as.data.frame()
  } 
  if (n==4 ){
    oc_2020_cabecera = lista_2020[n] %>% as.data.frame()
  } 
  if (n==5 ){
    de_2020_resto = lista_2020[n] %>% as.data.frame()
  } 
  if (n==6 ){
    ft_2020_resto = lista_2020[n] %>% as.data.frame()
  } 
  if (n==7 ){
    in_2020_resto = lista_2020[n] %>% as.data.frame()
  } 
  if (n==8 ){
    oc_2020_resto = lista_2020[n] %>% as.data.frame()
  } 
}

cabecera2020 = merge(x = cg_2020_cabecera , y = de_2020_cabecera , by = c('directorio','secuencia_p','orden'), all.x = T )  
cabecera2020 = merge(x = cabecera2020 , y = ft_2020_cabecera , by = c('directorio','secuencia_p','orden'), all.x = T )
cabecera2020 = merge(x = cabecera2020 , y = in_2020_cabecera , by = c('directorio','secuencia_p','orden'), all.x = T ) 
cabecera2020 = merge(x = cabecera2020 , y = oc_2020_cabecera , by = c('directorio','secuencia_p','orden'), all.x = T )
cabecera2020$periodo=2020

cabecera2020 %>% summarise(total=sum(fex_c_2011))

resto2020 = merge(x = cg_2020_resto , y = de_2020_resto , by = c('directorio','secuencia_p','orden'), all.x = T )  
resto2020 = merge(x = resto2020 , y = ft_2020_resto , by = c('directorio','secuencia_p','orden'), all.x = T )
resto2020 = merge(x = resto2020 , y = in_2020_resto , by = c('directorio','secuencia_p','orden'), all.x = T ) 
resto2020 = merge(x = resto2020 , y = oc_2020_resto , by = c('directorio','secuencia_p','orden'), all.x = T )
resto2020$periodo=2020

resto2020 %>% summarise(total=sum(fex_c_2011))

cabecera=plyr::rbind.fill(cabecera2019,cabecera2020)
resto=plyr::rbind.fill(resto2019,resto2020)

 
rm(list=ls()[grepl(pattern = "cabecera2", x = ls())])
rm(list=ls()[grepl(pattern = "resto2", x = ls())])
rm(list=ls()[grepl(pattern = "2020_cabecera", x = ls())])
rm(list=ls()[grepl(pattern = "2019_cabecera", x = ls())])
rm(list=ls()[grepl(pattern = "2020_resto", x = ls())])
rm(list=ls()[grepl(pattern = "2019_resto", x = ls())])
rm(list=ls()[grepl(pattern = "lista", x = ls())])
rm(list=ls()[grepl(pattern = "file", x = ls())])
rm(list=ls()[grepl(pattern = "geih", x = ls())])
rm(list=ls()[grepl(pattern = "n", x = ls())])
rm(list=ls()[grepl(pattern = "paquetes", x = ls())])


nacional = plyr::rbind.fill(cabecera,resto)
lapply(nacional, function(x) is.na(x) %>% table()) 
# Nivel
nacional=mutate(nacional,nivel=ifelse(test = (is.na(Cabecera.Ca))==T,yes = Resto.Ca,no = Cabecera.Ca))
nacional %>% group_by(periodo,nivel) %>% summarise(total=sum(fex_c_2011))
# desocupados
names(nacional)[names(nacional) == "Car"] <- "general"
names(nacional)[names(nacional) == "Des"] <- "desocupados"
names(nacional)[names(nacional) == "Ocu"] <- "ocupados"
names(nacional)[names(nacional) == "Ina"] <- "inactivos"
names(nacional)[names(nacional) == "Fue"] <- "fuerza"

nombres=c(grep('secuencia_p',colnames(nacional)),
          grep('orden',colnames(nacional)),
          grep('directorio',colnames(nacional)),
          grep('p6020',colnames(nacional)),
          grep('p6040',colnames(nacional)),
          grep('p6030s1',colnames(nacional)),
          grep('p6050',colnames(nacional)),
          grep('dpto',colnames(nacional)),
          grep('nivel',colnames(nacional)),
          grep('fex_c_2011',colnames(nacional)),
          grep('esc',colnames(nacional)),
          grep('mes',colnames(nacional)),
          grep('fuerza',colnames(nacional)),
          grep('desocupados',colnames(nacional)),
          grep('general',colnames(nacional)),
          grep('inactivos',colnames(nacional)),
          grep('ocupados',colnames(nacional)),
          grep('periodo',colnames(nacional))
)

nacional=nacional[,nombres]

cabecera %>% summarise(total=sum(fex_c_2011))
resto %>% summarise(total=sum(fex_c_2011))

