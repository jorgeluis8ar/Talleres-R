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
source("taller 1/Scripts/functions.R") 
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
          grep('p6920',colnames(nacional)))
nacional=nacional[,nombres]
# verificando el numero de personas por nivel (cabecera-resto) y periodo(2019-2020)
cabecera %>% group_by(periodo) %>% summarise(total=sum(fex_c_2011))
resto %>% group_by(periodo) %>% summarise(total=sum(fex_c_2011))
#---------------------------------------------------
#                 1.4 Descriptivas
#---------------------------------------------------
# calculando la tasa de desempleo para Junio de 2019 y 2020 para cabeceras y resto
pet=nacional %>% subset(fuerza==1) %>% group_by(periodo,nivel) %>% summarise(pet=sum(fex_c_2011)) 
ina=nacional %>% subset(inactivos==1) %>% group_by(periodo,nivel) %>% summarise(ina=sum(fex_c_2011))
des=nacional %>% subset(desocupados==1) %>% group_by(periodo,nivel) %>% summarise(des=sum(fex_c_2011))
pea=pet[,3]-ina[,3]
unemployment=(des[,3]/pea)*100
periodo=c("Junio 2019","Junio 2019","Junio 2020","Junio 2020")
nivel=c("Cabecera","Resto","Cabecera","Resto")
unemployment=cbind(periodo,nivel, unemployment) %>% print()
unemployment$periodo=as.character(unemployment$periodo)
unemployment$nivel=as.character(unemployment$nivel)
unemployment$des=round(unemployment$des,1)
# calculando la tasa de desempleo para Junio de 2019 y 2020
pet3=nacional %>% subset(fuerza==1) %>% group_by(periodo) %>% summarise(pet=sum(fex_c_2011)) 
ina3=nacional %>% subset(inactivos==1) %>% group_by(periodo) %>% summarise(inactivos=sum(fex_c_2011))
des3=nacional %>% subset(desocupados==1) %>% group_by(periodo) %>% summarise(desosocupados=sum(fex_c_2011))
pea3=pet3[,2]-ina3[,2]
unemployment3=(des3[,2]/pea3)*100
periodo3=c("Junio 2019","Junio 2020")
unemployment3=cbind(periodo3, unemployment3) %>% as.data.frame()%>% print()
# graficando la tasa de desempleo para Junio de 2019 y 2020 por nivel
td_nivel=ggplot(unemployment,aes(x = periodo,y =des,fill=nivel))+
            geom_bar(stat = "identity",position=position_dodge())+ theme_bw()+
            theme(legend.position="right")+
            labs(title = "Tasa de desempleo por nivel",y = "Tasa de desempleo",x = "Periodo")+
            theme(plot.title = element_text(hjust = 0.5))+
            geom_text(aes(label=des), vjust=-.3, color="black",position = position_dodge(0.9), size=3.5)+
            scale_fill_viridis(discrete = T,option = "E")+
            scale_color_discrete(name="Nivel",labels = c("Cabecera", "Resto"))
ggsave(plot= td_nivel , file = "Taller 1/Resultados/tasa de desempleo por nivel.jpeg")
# pegando los nombres de los departamentos con los cogidos DANE
deptos=readxl::read_excel("Taller 1/data/orignal/tasa_deso_sexo.xlsx","Sheet1")
colnames(deptos)=c('dpto','nombre')
nacional=merge(x = nacional,y =deptos,by="dpto",all.x = T)

# Fuerza laboral por departamento y periodo
fl_depto=nacional %>% subset(fuerza==1) %>% group_by(periodo,nombre) %>% summarise(total=sum(fex_c_2011)) %>%
as.data.frame() %>% ggplot(aes(x = nombre,y = total, group=periodo,color=periodo))+
                        geom_line()+geom_point()+theme_bw()+
                        labs(title = "Fuerza de trabajo por departamento",y = "Fuerza de trabajo",x = "Departamento")+
                        theme(plot.title = element_text(hjust = 0.5))+
                        theme(legend.position="right")+
                        scale_fill_viridis()+
                        scale_color_discrete(name="Año",labels = c("2019", "2020"))+
                        theme(axis.text.x = element_text(angle = 90))
ggsave(plot= fl_depto , file = "Taller 1/Resultados/fuerza de trabajo por depto.jpeg")
# Tasa de ocupacion por departamento y periodo
oc=nacional %>% subset(ocupados==1) %>% group_by(periodo,nombre) %>% summarise(total=sum(fex_c_2011)) %>% as.data.frame()
peet=nacional %>% subset(fuerza==1) %>% group_by(periodo,nombre) %>% summarise(pet=sum(fex_c_2011)) %>% as.data.frame() 
oc=merge(x = oc,y = peet,by = c('periodo','nombre'),all.x = T)
oc$to=(oc$total/oc$pet)*100
to_depto=ggplot(oc,aes(x = nombre,y = to,group=periodo,color=periodo))+
                        geom_line()+geom_point()+theme_bw()+
                        labs(title = "Tasa de ocupacion por departamento",y = "Tasa de ocupacion",x = "Departamento")+
                        theme(plot.title = element_text(hjust = 0.5))+
                        theme(legend.position="right")+
                        scale_fill_viridis()+
                        scale_color_discrete(name="Año",labels = c("2019", "2020"))+
                        theme(axis.text.x = element_text(angle = 90))
ggsave(plot= to_depto , file = "Taller 1/Resultados/tasa de ocupacion por depto.jpeg")
# Tasa de ocupacion por departamento y periodo
ocn=nacional %>% subset(ocupados==1) %>% group_by(periodo,nivel) %>% summarise(total=sum(fex_c_2011)) %>% as.data.frame()
peetn=nacional %>% subset(fuerza==1) %>% group_by(periodo,nivel) %>% summarise(pet=sum(fex_c_2011)) %>% as.data.frame() 
ocn=merge(x = ocn,y = peetn,by = c('periodo','nivel'),all.x = T)
ocn$to=(ocn$total/ocn$pet)*100
# Ingresos laborales por genero y periodo
nacional=mutate(nacional,sexo=ifelse(test = (nacional$p6020==1)==T,"Hombre","Mujer"))
  # Guardando la base nacional
  saveRDS(object = nacional , file = "Taller 1/Data/procesada/Base nacional.rds")
  
ingro_gen=nacional %>% subset(ocupados==1) %>% group_by(periodo,sexo) %>% summarise(ingresos=weighted.mean(inglabo,fex_c_2011,na.rm = T)) %>% 
as.data.frame() %>% ggplot(aes(x=sexo,y =ingresos,group=periodo,fill=periodo)) + 
                    geom_bar(stat = "identity",position = position_dodge())+ theme_bw()+
                    theme(legend.position="right")+
                    labs(title = "Ingresos laborales segun genero ",y = "Ingresos laborales",x = "Genero")+
                    theme(plot.title = element_text(hjust = 0.5))+
                    geom_text(aes(label=round(ingresos,2)), vjust=-.3, color="black",position = position_dodge(0.9), size=3.5)+
                    scale_fill_viridis(discrete = T,option = "E")+
                    scale_color_discrete(name="Nivel",labels = c("Cabecera", "Resto"))
ggsave(plot= ingro_gen , file = "Taller 1/Resultados/ingresos por genero.jpeg")
# Ingresos laborales por edad
ingresos=nacional %>% subset(ocupados==1) %>% group_by(periodo,p6040) %>% summarise(ingresos=weighted.mean(inglabo,fex_c_2011,na.rm = T)) %>% as.data.frame()
colnames(ingresos)=c("periodo","edad","ingresos")
ingresos=subset(ingresos,edad>=15&edad<=75)
ingre_edad=ggplot(ingresos,aes(y = ingresos,x=edad,group=periodo,color=periodo)) + 
          geom_line()+geom_point()+theme_bw()+
          labs(title = "Ingresos laborales segun edad",y = "Ingresos laborales",x = "Edad")+
          theme(plot.title = element_text(hjust = 0.5))+scale_fill_viridis()
ggsave(plot= ingre_edad , file = "Taller 1/Resultados/ingresos por edad.jpeg")

fl_nivel_period=nacional %>% subset(fuerza==1) %>% group_by(periodo,nivel) %>% summarise(total=sum(fex_c_2011)) %>% 
as.data.frame() %>% ggplot(.,aes(x=nivel,y =total,group=periodo,fill=periodo)) + 
                    geom_bar(stat = "identity",position = position_dodge()) + theme_bw()+
                    labs(title = "Fuerza laboral por nivel y periodo",y = "Fuerza laboral",x = "Nivel")+
                    theme(plot.title = element_text(hjust = 0.5))+
                    geom_text(aes(label=round(total,2)), vjust=-.3, color="black",position = position_dodge(0.9), size=3.5)+
                    scale_fill_viridis(discrete = T,option = "E")
ggsave(plot= fl_nivel_period , file = "Taller 1/Resultados/fuerza laboral por nivel y periodo.jpeg")
# TD por edad
td_edad=nacional %>% subset(fuerza==1) %>% group_by(periodo,p6040) %>% summarise(pet=sum(fex_c_2011)) %>% as.data.frame() 
ina2=nacional %>% subset(inactivos==1) %>% group_by(periodo,p6040) %>% summarise(ina=sum(fex_c_2011)) %>% as.data.frame()
des2=nacional %>% subset(desocupados==1) %>% group_by(periodo,p6040) %>% summarise(total=sum(fex_c_2011)) %>% as.data.frame()

unemploy=merge(x = td_edad,y = ina2,by = c("p6040","periodo"),suffixes = c("_pet","ina"),all.x = T) %>% 
         merge(.,y = des2,by = c("p6040","periodo"),suffixes = c("_pet","ina"),all.x = T) %>% 
         mutate(.,td=((.$total)/(.$pet-.$ina))*100) %>% subset(p6040>=15&p6040<=75)
colnames(unemploy)[1]='edad'

td_edad=ggplot(unemploy,aes(x = edad,y = td, group=periodo,color=periodo))+
                  geom_line()+geom_point()+theme_bw()+
                  labs(title = "Tasas de desempleo por grupo de edad",y = "Edad",x = "Tasa de desempleo")+
                  theme(plot.title = element_text(hjust = 0.5))+
                  scale_x_continuous(n.breaks = 20)+
                  theme(legend.position="right")+
                  scale_fill_viridis()+
                  scale_color_discrete(name="Año",labels = c("2019", "2020"))
# ggsave(plot= td_edad , file = "Taller 1/Resultados/tasa de desempleo por edad.jpeg")
#Ingresos laborales por tipo de contrato, edad y periodo
contrato = nacional %>% subset(fuerza==1&is.na(p6440)==F) %>%  group_by(periodo,p6440,p6040) %>% summarise(salario=weighted.mean(inglabo,fex_c_2011,na.rm = T)) %>% 
as.data.frame() %>% subset(p6040>=15&p6040<=75)
contrato$tipo=ifelse(test = (contrato$p6440==1)==T,"Contrato laboral","Sin contrato laboral")
contrato=ggplot(contrato,aes(x = p6040,y = salario,group=interaction(periodo,tipo),color=periodo,shape=tipo))+ # ayuda de "https://stackoverflow.com/questions/9968976/group-by-two-columns-in-ggplot2"
                   geom_line()+geom_point()+theme_bw()+
                   labs(title = "Ingresos laborales por tipo de contrato, edad y periodo",y = "Ingresos laboral",x = "Edad")+
                   theme(plot.title = element_text(hjust = 0.5))+
                   scale_x_continuous(n.breaks = 20)+ #https://stackoverflow.com/questions/11335836/increase-number-of-axis-ticks
                   theme(legend.position="right")+
                   scale_fill_viridis()
ggsave(plot= contrato , file = "Taller 1/Resultados/Ingresos contrato.jpeg")
rm(list=ls())
#---------------------------------------------------
#                   1.5 Reshape
#---------------------------------------------------

archivo="/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres-R/Taller 1/data/orignal/tasa_deso_sexo.xlsx"
base=readxl::read_excel(archivo,sheet = "Hoja1")

base$year=substr(base$pais,10,10)
base$country=ifelse(base$year=="2",NA,base$pais)
base=base %>% fill(country, .direction = "down") %>% as.data.frame()
base$year=substr(base$pais,10,13)
base$year=as.numeric(base$year)
colnames(base)[2]="total"
base=subset(base,is.na(base$year)==F)
base=base[,c(6,5,2,3,4)]
base=reshape2::melt(base,id.vars=c("country","year"),value.name = 'tasa')
base$tasa=as.numeric(base$tasa) 
base$tasa=round(base$tasa,2)
colnames(base)[3]="clase"
rm(list=ls())
#---------------------------------------------------
#                    TALLER B
#---------------------------------------------------

file = "/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres-R/Taller 1/Data/procesada/Base nacional.rds"
nacional=readRDS(file)
#Tasa de ocupacion por genero
oc=nacional %>% subset(ocupados==1) %>% group_by(periodo,sexo) %>% summarise(ocupados=sum(fex_c_2011)) %>% as.data.frame()
peetn=nacional %>% subset(fuerza==1) %>% group_by(periodo,sexo) %>% summarise(pet=sum(fex_c_2011)) %>% as.data.frame() 
oc=merge(x = oc,y = peetn,by = c('periodo','sexo'),all.x = T)
oc$to=(oc$ocupados/oc$pet)*100
#Tasa de ocupacion por genero, periodo y edad
oc_edad=nacional %>% subset(ocupados==1) %>% group_by(periodo,sexo,p6040) %>% summarise(ocupados=sum(fex_c_2011)) %>% as.data.frame()
peet_edad=nacional %>% subset(fuerza==1) %>% group_by(periodo,sexo,p6040) %>% summarise(pet=sum(fex_c_2011)) %>% as.data.frame() 
oc_edad=merge(x = oc_edad,y = peet_edad,by = c('periodo','sexo','p6040'),all.x = T)
oc_edad$to=(oc_edad$ocupados/oc_edad$pet)*100
oc_edad = subset(oc_edad,p6040>=15&p6040<=75)
to_ed_geb=ggplot(oc_edad,aes(x = p6040,y = to, group=interaction(periodo,sexo), color=periodo,shape=sexo))+ 
                            geom_line()+geom_point()+theme_bw()+
                            labs(title = "Tasa de ocupación por edad y género",y = "Tasa de ocupación",x = "Edad")+
                            theme(plot.title = element_text(hjust = 0.5))+
                            scale_x_continuous(n.breaks = 20)+ #https://stackoverflow.com/questions/11335836/increase-number-of-axis-ticks
                            theme(legend.position="right")+
                            scale_fill_viridis()
ggsave(plot= to_ed_geb , file = "Taller 1/Resultados/tasa de ocupacion por genero y edad.jpeg")
# Tasa de desempleo por genero, periodo y edad
pet=nacional %>% subset(fuerza==1) %>% group_by(periodo,sexo) %>% summarise(pea=sum(fex_c_2011)) 
ina=nacional %>% subset(inactivos==1) %>% group_by(periodo,sexo) %>% summarise(inactivos=sum(fex_c_2011))
des=nacional %>% subset(desocupados==1) %>% group_by(periodo,sexo) %>% summarise(desosocupados=sum(fex_c_2011))
pea=pet[,3]-ina[,3]
unemployment3=(des[,3]/pea)*100
periodo3=c("Junio 2019","Junio 2019","Junio 2020","Junio 2020")
sexo3=c("Hombre","Mujer","Hombre","Mujer")
unemployment3=cbind(sexo3,periodo3, unemployment3,des[,3],pea,ina[,3]) %>% as.data.frame()%>% print()

pet=nacional %>% subset(fuerza==1) %>% group_by(periodo,sexo,p6040) %>% summarise(pea=sum(fex_c_2011)) 
ina=nacional %>% subset(inactivos==1) %>% group_by(periodo,sexo,p6040) %>% summarise(inactivos=sum(fex_c_2011))
des=nacional %>% subset(desocupados==1) %>% group_by(periodo,sexo,p6040) %>% summarise(desosocupados=sum(fex_c_2011))

pet = merge(x = pet,y = ina,by = c('periodo','sexo','p6040'),all.x = T) %>% 
      merge(.,y = des,by = c('periodo','sexo','p6040'),all.x = T)
pet$td=((pet$desosocupados)/(pet$pea-pet$inactivos)*100)
pet = subset(pet,p6040>=15&p6040<=75)
td_ed_geb=ggplot(pet,aes(x = p6040,y = td, group=interaction(periodo,sexo), color=periodo,shape=sexo))+ 
  geom_line()+geom_point()+theme_bw()+
  labs(title = "Tasa de ocupación por edad y género",y = "Tasa de desempleo",x = "Edad")+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_x_continuous(n.breaks = 20)+ #https://stackoverflow.com/questions/11335836/increase-number-of-axis-ticks
  theme(legend.position="right")+
  scale_fill_viridis()
ggsave(plot= td_ed_geb , file = "Taller 1/Resultados/tasa de desempleo por genero y edad.jpeg")
