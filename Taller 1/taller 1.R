# Codigo creado por: Jorge Luis Ochoa Rincon
# Codigo: 201711018
# Taller de R - Task 1

#---------------------------------------------------
#     Limpiando la consola y cargando paquetes
#---------------------------------------------------
cat("\f")
rm(list=ls())
options("scipen"=100, "digits"=4)
setwd("/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres-R")

paquetes=c("tidyverse","data.table","ggplot2",'viridis')

lapply(paquetes,require,character.only=T)
source("taller 1/functions.R") 
#---------------------------------------------------
#          1.1 Importar bases de datos 
#---------------------------------------------------
# Lista para junio de 2019
file_archivos <- list.files("Taller 1/data/orignal/Junio 2019") %>% paste0("Taller 1/data/orignal/Junio 2019/",.)
lista_2019 = lapply(file_archivos,function(x) geih(path_file = x)) 
cg_2019_cabecera = lista_2019[1] %>% as.data.frame() # se sepata caracteristicas generales de la lista - cabecera
cg_2019_resto = lista_2019[6]  %>% as.data.frame() # se sepata caracteristicas generales de la lista - resto
lista_2019 = lista_2019[-1] # Eliminando caracteristicas generales de cabecera
lista_2019 = lista_2019[-5] # Eliminando caracteristicas generales de resto

# Creando una base de datos que una todos los datos de cabecera para junio 2019
cabecera2019 = merge(x = cg_2019_cabecera,y =  lista_2019[[1]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
               merge(.,y = lista_2019[[2]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
               merge(.,y = lista_2019[[3]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
               merge(.,y = lista_2019[[4]],by = c('directorio','secuencia_p','orden'), all.x = T)

cabecera2019$periodo="2019"

cabecera2019 %>% summarise(total=sum(fex_c_2011))
# Creando una base de datos que una todos los datos de resto para junio 2019
resto2019 = merge(x = cg_2019_resto,y = lista_2019[[5]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
            merge(.,y = lista_2019[[6]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
            merge(.,y = lista_2019[[7]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
            merge(.,y = lista_2019[[8]],by = c('directorio','secuencia_p','orden'), all.x = T)
resto2019$periodo="2019"

resto2019 %>% summarise(total=sum(fex_c_2011))
# Lista para junio de 2020
file_archivos <- list.files("Taller 1/data/orignal/Junio2 2020") %>% paste0("Taller 1/data/orignal/Junio2 2020/",.)
lista_2020 = lapply(file_archivos,function(x) geih3(path_file = x))
cg_2020_cabecera = lista_2020[1] %>% as.data.frame() # se sepata caracteristicas generales de la lista - cabecera
cg_2020_resto = lista_2020[6] %>% as.data.frame() # se sepata caracteristicas generales de la lista - cabecera
lista_2020 = lista_2020[-1] # Eliminando caracteristicas generales de cabecera
lista_2020 = lista_2020[-5]  # Eliminando caracteristicas generales de resto


# Creando una base de datos que una todos los datos de cabecera para junio 2020
cabecera2020 = merge(x = cg_2020_cabecera,y =  lista_2020[[1]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
               merge(.,y = lista_2020[[2]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
               merge(.,y = lista_2020[[3]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
               merge(.,y = lista_2020[[4]],by = c('directorio','secuencia_p','orden'), all.x = T)

cabecera2020$periodo="2020"

cabecera2020 %>% summarise(total=sum(fex_c_2011))
# Creando una base de datos que una todos los datos de resto para junio 2020
resto2020 = merge(x = cg_2020_resto,y = lista_2020[[5]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
            merge(.,y = lista_2020[[6]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
            merge(.,y = lista_2020[[7]],by = c('directorio','secuencia_p','orden'), all.x = T) %>% 
            merge(.,y = lista_2020[[8]],by = c('directorio','secuencia_p','orden'), all.x = T)
resto2020$periodo="2020"

resto2020 %>% summarise(total=sum(fex_c_2011))
#---------------------------------------------------
#                 1.2 Unir datos
#---------------------------------------------------
# Uniendo y consolidando las bases de datos por cabecera y resto
cabecera=plyr::rbind.fill(cabecera2019,cabecera2020)
resto=plyr::rbind.fill(resto2019,resto2020)
# Limpiando la consola para dejar unicamente los dos anteriores objetos
rm(list=ls()[grepl(pattern = "cabecera2", x = ls())])
rm(list=ls()[grepl(pattern = "resto2", x = ls())])
rm(list=ls()[grepl(pattern = "2020_cabecera", x = ls())])
rm(list=ls()[grepl(pattern = "2019_cabecera", x = ls())])
rm(list=ls()[grepl(pattern = "2020_resto", x = ls())])
rm(list=ls()[grepl(pattern = "2019_resto", x = ls())])
rm(list=ls()[grepl(pattern = "lista", x = ls())])
rm(list=ls()[grepl(pattern = "file", x = ls())])
rm(list=ls()[grepl(pattern = "geih", x = ls())])
rm(list=ls()[grepl(pattern = "paquetes", x = ls())])
#---------------------------------------------------
#              1.3 Una base nacional
#---------------------------------------------------
# creando la base nacional
nacional = plyr::rbind.fill(cabecera,resto)

lapply(nacional, function(x) is.na(x) %>% table()) 
#Nivel: creando una variable de indicador de cabecera o resto
nacional=mutate(nacional,nivel=ifelse(test = (is.na(Cabecera.Ca))==T,yes = Resto.Ca,no = Cabecera.Ca))
nacional %>% group_by(periodo,nivel) %>% summarise(total=sum(fex_c_2011))
# Organizando las variables y limpiando la base
names(nacional)[names(nacional) == "Car"] <- "general"
names(nacional)[names(nacional) == "Des"] <- "desocupados"
names(nacional)[names(nacional) == "Ocu"] <- "OC"
names(nacional)[names(nacional) == "Ina"] <- "inactivos"
names(nacional)[names(nacional) == "Fue"] <- "fuerza"
# creando indicadores para cada modulo de la GEIH
nacional$general=ifelse(test = is.na(nacional$general)==T,0,1)
nacional$desocupados=ifelse(test = is.na(nacional$desocupados)==T,0,1)
nacional$ocupados=ifelse(test = is.na(nacional$OC)==T,0,1)
nacional$inactivos=ifelse(test = is.na(nacional$inactivos)==T,0,1)
nacional$fuerza=ifelse(test = is.na(nacional$fuerza)==T,0,1)
# Eliminando variables
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
          grep('periodo',colnames(nacional)),
          grep('inglabo',colnames(nacional)),
          grep('p6440',colnames(nacional)),
          grep('p6450',colnames(nacional)),
          grep('inglabodes',colnames(nacional)),
          grep('p6920',colnames(nacional))
          
)

nacional=nacional[,nombres]

cabecera %>% group_by(periodo) %>% summarise(total=sum(fex_c_2011))
resto %>% group_by(periodo) %>% summarise(total=sum(fex_c_2011))
#---------------------------------------------------
#                 1.4 Descriptivas
#---------------------------------------------------
pet=nacional %>% subset(fuerza==1) %>% group_by(periodo,nivel) %>% summarise(pet=sum(fex_c_2011)) 
ina=nacional %>% subset(inactivos==1) %>% group_by(periodo,nivel) %>% summarise(ina=sum(fex_c_2011))
des=nacional %>% subset(desocupados==1) %>% group_by(periodo,nivel) %>% summarise(des=sum(fex_c_2011))

pea=pet[,3]-ina[,3]
unemployment=(des[,3]/pea)*100

periodo=c("Junio 2019","Junio 2019","Junio 2020","Junio 2020")
nivel=c("Cabecera","Nivel","Cabecera","Nivel")
unemployment=cbind(periodo,nivel, unemployment)

pet3=nacional %>% subset(fuerza==1) %>% group_by(periodo) %>% summarise(pet=sum(fex_c_2011)) 
ina3=nacional %>% subset(inactivos==1) %>% group_by(periodo) %>% summarise(inactivos=sum(fex_c_2011))
des3=nacional %>% subset(desocupados==1) %>% group_by(periodo) %>% summarise(desosocupados=sum(fex_c_2011))

pea3=pet3[,2]-ina3[,2]
unemployment3=(des3[,2]/pea3)*100

periodo3=c("Junio 2019","Junio 2020")
unemployment3=cbind(periodo3, unemployment3)

ggplot(unemployment)+geom_bar(aes(x = periodo,y =total),stat = "identity", fill="#f68060", alpha=.6, width=.4)

deptos=readxl::read_excel("Taller 1/data/orignal/tasa_deso_sexo.xlsx","Sheet1")
colnames(deptos)=c('dpto','nombre')
nacional=merge(x = nacional,y =deptos,by="dpto",all.x = T)



nacional %>% subset(fuerza==1) %>% group_by(periodo,nombre) %>% summarise(total=sum(fex_c_2011)) %>%
as.data.frame() %>% ggplot(aes(x = nombre,y = total, group=periodo,color=periodo))+
                        geom_line()+
                        geom_point()+
                        theme_bw()+
                        labs(title = "Fuerza de trabajo por departamento",y = "Fuerza de trabajo",x = "Departamento")+
                        theme(plot.title = element_text(hjust = 0.5))+
                        theme(legend.position="right")+
                        scale_fill_viridis()+
                        scale_color_discrete(name="Año",labels = c("2019", "2020"))+
                        theme(axis.text.x = element_text(angle = 90))

oc=nacional %>% subset(ocupados==1) %>% group_by(periodo) %>% summarise(total=sum(fex_c_2011))
oc=mutate(oc[,2]/pet3[,2])*100
TO=cbind(periodo3,oc)

nacional=mutate(nacional,sexo=ifelse(test = (nacional$p6020==1)==T,"Hombre","Mujer"))
nacional %>% subset(ocupados==1) %>% group_by(periodo,sexo) %>% summarise(ingresos=weighted.mean(inglabo,fex_c_2011,na.rm = T)) %>% 
as.data.frame() %>% ggplot() + geom_bar(aes(x=sexo,y =ingresos,group=periodo,fill=periodo),stat = "identity",position = position_dodge())

heat_map=nacional %>% subset(ocupados==1) %>% group_by(periodo,p6040,esc) %>% summarise(ingresos=weighted.mean(inglabo,fex_c_2011,na.rm = T)) %>% as.data.frame()
colnames(heat_map)=c("periodo","edad","escolaridad","ingresos")
heat_map=subset(heat_map,edad>=15&edad<=75)
ggplot(heat_map) + 
  geom_point(aes(y = ingresos,x=escolaridad,size=escolaridad))+
  scale_fill_viridis()

nacional %>% subset(fuerza==1) %>% group_by(periodo,nivel) %>% summarise(total=sum(fex_c_2011)) %>% 
as.data.frame() %>% ggplot() + geom_bar(aes(x=nivel,y =total,group=periodo,fill=periodo),stat = "identity",position = position_dodge())

# TD por edad
pet2=nacional %>% subset(fuerza==1) %>% group_by(periodo,p6040) %>% summarise(total=sum(fex_c_2011)) %>% 
as.data.frame() %>% reshape2::dcast(formula =  p6040 ~ periodo , value.var="total") 

ina2=nacional %>% subset(inactivos==1) %>% group_by(periodo,p6040) %>% summarise(total=sum(fex_c_2011)) %>% 
as.data.frame() %>% reshape2::dcast(formula =  p6040 ~ periodo , value.var="total") 

des2=nacional %>% subset(desocupados==1) %>% group_by(periodo,p6040) %>% summarise(total=sum(fex_c_2011)) %>% 
as.data.frame() %>% reshape2::dcast(formula =  p6040 ~ periodo , value.var="total")

unemploy=merge(x = pet2,y = ina2,by = "p6040",suffixes = c("_pet","ina"),all.x = T) %>% 
         merge(y = des2,by = "p6040",all.x = T)

unemploy=mutate(unemploy,desempleo2019=(unemploy$`2019`/(unemploy$`2019_pet`-unemploy$`2019ina`)*100))
unemploy=mutate(unemploy,desempleo2020=(unemploy$`2020`/(unemploy$`2020_pet`-unemploy$`2020ina`)*100))
unemploy=subset(unemploy,p6040>=15 & p6040 <=75) %>% .[,c(1,8,9)]
colnames(unemploy)=c("edad","2019","2020")
unemploy=reshape2::melt(data=unemploy,id.vars=c("edad"),value.name = 'periodo')
unemploy$variable=as.character(unemploy$variable)


ggplot(unemploy,aes(x = edad,y = periodo, group=variable,color=variable))+
                  geom_line()+
                  geom_point()+
                  theme_bw()+
                  labs(title = "Tasas de desempleo por grupo de edad",y = "Edad",x = "Tasa de desempleo")+
                  theme(plot.title = element_text(hjust = 0.5))+
                  scale_x_continuous(n.breaks = 20)+
                  theme(legend.position="right")+
                  scale_fill_viridis()+
                  scale_color_discrete(name="Año",labels = c("2019", "2020"))