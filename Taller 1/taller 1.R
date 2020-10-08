# Codigo creado por: Jorge Luis Ochoa Rincon
# Codigo: 201711018
# Taller de R - Task 1

# Limpiando la consola

cat("\f")
rm(list=ls())
options("scipen"=100, "digits"=4)
setwd("/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres-R")

paquetes=c("tidyverse","data.table","ggplot2",'viridis')

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
cabecera2019$periodo="2019"

cabecera2019 %>% summarise(total=sum(fex_c_2011))

resto2019 = merge(x = cg_2019_resto , y = de_2019_resto , by = c('directorio','secuencia_p','orden'), all.x = T )  
resto2019 = merge(x = resto2019 , y = ft_2019_resto , by = c('directorio','secuencia_p','orden'), all.x = T )
resto2019 = merge(x = resto2019 , y = in_2019_resto , by = c('directorio','secuencia_p','orden'), all.x = T ) 
resto2019 = merge(x = resto2019 , y = oc_2019_resto , by = c('directorio','secuencia_p','orden'), all.x = T )
resto2019$periodo="2019"

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
cabecera2020$periodo="2020"

cabecera2020 %>% summarise(total=sum(fex_c_2011))

resto2020 = merge(x = cg_2020_resto , y = de_2020_resto , by = c('directorio','secuencia_p','orden'), all.x = T )  
resto2020 = merge(x = resto2020 , y = ft_2020_resto , by = c('directorio','secuencia_p','orden'), all.x = T )
resto2020 = merge(x = resto2020 , y = in_2020_resto , by = c('directorio','secuencia_p','orden'), all.x = T ) 
resto2020 = merge(x = resto2020 , y = oc_2020_resto , by = c('directorio','secuencia_p','orden'), all.x = T )
resto2020$periodo="2020"

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
names(nacional)[names(nacional) == "Ocu"] <- "OC"
names(nacional)[names(nacional) == "Ina"] <- "inactivos"
names(nacional)[names(nacional) == "Fue"] <- "fuerza"

nacional$general=ifelse(test = is.na(nacional$general)==T,0,1)
nacional$desocupados=ifelse(test = is.na(nacional$desocupados)==T,0,1)
nacional$ocupados=ifelse(test = is.na(nacional$OC)==T,0,1)
nacional$inactivos=ifelse(test = is.na(nacional$inactivos)==T,0,1)
nacional$fuerza=ifelse(test = is.na(nacional$fuerza)==T,0,1)

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