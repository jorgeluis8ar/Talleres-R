# Codigo creado por: Jorge Luis Ochoa Rincon
# Codigo: 201711018
# Taller de R - Task 1

# Limpiando la consola y cargando paquetes --------------------------------

cat("\f")
rm(list=ls())
options("scipen"=100, "digits"=4)
setwd("/Users/jorgeochoa/Documents/Universidad/Taller de R/Taller 2")

paquetes=c("tidyverse","data.table","ggplot2",'viridis','sf','ggspatial','dplyr','zoo')

lapply(paquetes,require,character.only=T)
rm(paquetes)

# 1.1 Descargar la base de datos ----------------------------------------------

# 1.2 Importanto las bases de datos -------------------------------------------

meses = list.files('Datos/2019') %>% paste0('Datos/2019/',.,'/')
files = lapply(1:length(meses),function(x) list.files(meses[x]) %>% paste0(meses[x],.))  %>% unlist()
meses2 = list.files('Datos/2018') %>% paste0('Datos/2018/',.,'/')
files2 = lapply(1:length(meses2),function(x) list.files(meses2[x]) %>% paste0(meses2[x],.))  %>% unlist()


f_read = function(path){
  if (substr(x = path,start = str_locate(path,'Datos/')[2]+1,stop = 10)=='2019') 
 {data = read.csv(file = path , sep = ';')
  colnames(data) = tolower(colnames(data))
  archivo = substr(path,start = str_locate(path,'Datos/2019/')[2]+1,str_locate(files[1],'.csv')[1]-1)
  data = mutate(data, mes = archivo)
  data$fex_c_2011 = as.character(data$fex_c_2011) %>% str_replace(.,',','.') %>% as.numeric()
  data = mutate(data, periodo = substr(x = path,start = str_locate(path,'Datos/')[2]+1,stop = 10))
  return(data)}
  if (substr(x = path,start = str_locate(path,'Datos/')[2]+1,stop = 10)=='2018') 
  {data = read.csv(file = path , sep = ';')
  colnames(data) = tolower(colnames(data))
  archivo = substr(path,start = str_locate(path,'Datos/2018/')[2]+1,str_locate(files[1],'.csv')[1]-1)
  data = mutate(data, mes = archivo)
  data = mutate(data, periodo = substr(x = path,start = str_locate(path,'Datos/')[2]+1,stop = 10))
  data$fex_c_2011 = as.character(data$fex_c_2011) %>% str_replace(.,',','.') %>% as.numeric()
  return(data)}
}

lista_archivos = files[c(grep('Cabecera',files),
                         grep('Resto',files))] %>% 
                  .[c(grep('Caracter',.),
                      grep('Desocupados',.),
                      grep('Inactivos',.),
                      grep('Ocupados',.),
                      grep('Fuerza',.))]

lista_archivos2 = files2[c(grep('Cabecera',files2),
                         grep('Resto',files2))] %>% 
                .[c(grep('Caracter',.),
                    grep('Desocupados',.),
                    grep('Inactivos',.),
                    grep('Ocupados',.),
                    grep('Fuerza',.))]

lista_data = lapply(lista_archivos, function(x) f_read(path = x))
lista_data2 = lapply(lista_archivos2, function(x) f_read(path = x))


carac_general = plyr::rbind.fill(lista_data[1:12] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1),
                                 lista_data[13:24] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0),
                                 lista_data2[1:12] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1),
                                 lista_data2[13:24] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0))
carac_general %>% group_by(mes,periodo) %>% summarise(total=sum(fex_c_2011)) %>% as.data.frame()

duplicated(paste0(carac_general$secuencia_p,carac_general$directorio,carac_general$orden,carac_general$mes)) %>% table()
desocupado = plyr::rbind.fill(lista_data[25:36] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(desocupado=1),
                              lista_data[37:48] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0) %>% mutate(desocupado=1),
                              lista_data2[25:36] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(desocupado=1),
                              lista_data2[37:48] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0) %>% mutate(desocupado=1))

inactivo = plyr::rbind.fill(lista_data[49:60] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(inanctivo=1),
                            lista_data[61:72] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0) %>% mutate(inanctivo=1),
                            lista_data2[49:60] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(inanctivo=1),
                            lista_data2[61:72] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0) %>% mutate(inanctivo=1))

ocupado = plyr::rbind.fill(lista_data[73:84] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(ocupado=1),
                           lista_data[85:96] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0) %>% mutate(ocupado=1),
                           lista_data2[73:84] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(ocupado=1),
                           lista_data2[85:96] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0) %>% mutate(ocupado=1))

fuerza = plyr::rbind.fill(lista_data[97:108] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(fuerza=1),
                          lista_data[109:120] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0)%>% mutate(fuerza=1),
                          lista_data2[97:108] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(fuerza=1),
                          lista_data2[109:120] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0)%>% mutate(fuerza=1))

# 1.3 Uniendo las bases de datos ------------------------------------------

nacional = merge(x = carac_general,y = desocupado,by = c('secuencia_p','directorio','orden','mes','periodo'),all.x = T) %>% 
           merge(x = .,y = inactivo,by = c('secuencia_p','directorio','orden','mes','periodo'),all.x = T) %>% 
           merge(x = .,y = ocupado ,by = c('secuencia_p','directorio','orden','mes','periodo'),all.x = T,suffixes = c('_cg','_ocu')) %>% 
           merge(x = .,y = fuerza  ,by = c('secuencia_p','directorio','orden','mes','periodo'),all.x = T,suffixes = c('_cg','_fuer'))
nacional %>% group_by(mes,periodo) %>% summarise(total=sum(fex_c_2011.x,na.rm=T)) %>% as.data.frame()
rm(lista_data,lista_archivos2,meses,meses2,carac_general,inactivo,ocupado,fuerza,desocupado,lista_data2,lista_archivos,files, files2,path)
# 1.4 Descriptivas --------------------------------------------------------

pet = nacional %>% subset(fuerza==1) %>% group_by(mes,periodo) %>% summarise(pet=sum(fex_c_2011.x)) %>% 
      reshape2::dcast(.,formula = mes~periodo,value.var = 'pet')
colnames(pet)=c('mes','pet_2018','pet_2019')
ina = nacional %>% subset(inanctivo==1) %>% group_by(mes,periodo) %>% summarise(ina=sum(fex_c_2011)) %>% 
      reshape2::dcast(.,formula = mes~periodo,value.var = 'ina')
colnames(ina)=c('mes','ina_2018','ina_2019')
des = nacional %>% subset(desocupado==1) %>% group_by(mes,periodo) %>% summarise(des=sum(fex_c_2011.x)) %>% 
      reshape2::dcast(.,formula = mes~periodo,value.var = 'des')
colnames(des)=c('mes','des_2018','des_2019')
desempleo = merge(x = pet,y = ina,by = 'mes',all.x=T) %>% 
            merge(x = .,y = des,by = 'mes',all.x=T)
desempleo = mutate(desempleo, pea_2018=(pet_2018-ina_2018))
desempleo = mutate(desempleo, pea_2019=(pet_2019-ina_2019))
desempleo = mutate(desempleo, un_2018=(des_2018/pea_2018)*100)
desempleo = mutate(desempleo, un_2019=(des_2019/pea_2019)*100)
desempleo = mutate(desempleo , diff_ocu = (pet_2019 - pet_2018)/1000)
desempleo = mutate(desempleo , diff_ina = (ina_2019 - ina_2018)/1000)
desempleo = mutate(desempleo , diff_deso = (des_2019 - des_2018)/1000)

ggplot(data = desempleo) + geom_area(aes(x = mes_num, y = diff_deso),colour = 'blue', fill = "blue", alpha= .2) +
                           geom_area(aes(x = mes_num, y = diff_ocu), colour = 'red', fill = "red", alpha = .2) +
                           geom_area(aes(x = mes_num, y = diff_ina), colour = 'green', fill = "green", alpha=.2)+
    theme_bw() + scale_fill_manual("Poblaciones", labels = c('Desocupados','Ocupados','Inactivos'))

desempleo$mes_num = ifelse(desempleo$mes=="Enero",1,
                    ifelse(desempleo$mes=='Febre',2,
                    ifelse(desempleo$mes=='Marzo',3,
                    ifelse(desempleo$mes=='Abril',4,
                    ifelse(desempleo$mes=='Mayo.',5,
                    ifelse(desempleo$mes=='Junio',6,
                    ifelse(desempleo$mes=='Julio',7,
                    ifelse(desempleo$mes=='Agost',8,
                    ifelse(desempleo$mes=='Septi',9,
                    ifelse(desempleo$mes=='Octub',10,
                    ifelse(desempleo$mes=='Novie',11,
                    ifelse(desempleo$mes=='Dicie',12,0))))))))))))
desempleo = desempleo[order(desempleo$mes_num),]
desempleo = reshape2::melt(data = desempleo, id.vars=c("mes","mes_num"),value.name='desem') %>% subset(.,variable=="un_2019"|variable=='un_2018')
desempleo = mutate(desempleo, fecha = as.yearmon(ifelse(desempleo$variable=='un_2018',paste0('2018','-',desempleo$mes_num),
                                                 ifelse(desempleo$variable=='un_2019',paste0('2019','-',desempleo$mes_num),"0"))))
ggplot(data = desempleo,aes(x = fecha,y = desem)) +
  geom_line(colour = '#d1134f') + geom_point(colour = 'black', fill= "#d1134f",size = 1.5,shape = 23) + theme_bw()+
  labs(title = 'Tasa de desempleo nacional',subtitle = 'Mensual, Enero - 2018 a Diciembre - 2019',
       x = 'Periodo', y = 'Tasa de desempleo (%)')+
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5),
        panel.grid.minor = element_line(size = 0.15),
        panel.grid.major = element_line(size = 0.15),
        axis.title.y = element_text(size = 8),
        axis.title.x = element_text(size = 8))
ggsave(filename = '/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres-R/Taller 2/Resultados/desempleo.jpeg',width = 16,height = 8,units = "cm")      

poblacion = nacional %>% subset(.,is.na(dpto.x)==F) %>%  group_by(dpto.x,mes,periodo) %>% summarise(pob=sum(fex_c_2011.x,na.rm=T)) %>% as.data.frame()
analfabetismo = nacional %>% subset(.,p6160==2&is.na(dpto.x)==F) %>%  group_by(dpto.x,mes,periodo) %>% summarise(total = sum(fex_c_2011.x)) %>% as.data.frame()
tasa_illite = merge(x = analfabetismo,y = poblacion,by = c('dpto.x','mes','periodo'),all.x =T )
tasa_illite = mutate(tasa_illite,porcentaje=(total/pob)*100)
tasa_illite = mutate(tasa_illite,x10=(total/pob)*100000)
tasa_illite = aggregate(tasa_illite,by = list(tasa_illite$dpto.x,tasa_illite$periodo), mean)
tasa_illite$dpto.x=tasa_illite$Group.1
tasa_illite$periodo=tasa_illite$Group.2
tasa_illite = tasa_illite[,-c(1,2,4)]
tasa_illite = dcast(setDT(tasa_illite),formula = dpto.x~periodo,value.var = c('porcentaje','pob','total','x10'))
tasa_illite$dpto.x = ifelse(tasa_illite$dpto.x=='5','05',ifelse(tasa_illite$dpto.x=='8','08',tasa_illite$dpto.x))
tasa_illite = mutate(tasa_illite,pobtotal_2018=sum(pob_2018))
tasa_illite = mutate(tasa_illite,pobtotal_2019=sum(pob_2019))
tasa_illite = mutate(tasa_illite,percentage_2018=(pob_2018/pobtotal_2018)*100)
tasa_illite = mutate(tasa_illite,percentage_2019=(pob_2019/pobtotal_2019)*100)

educacion = nacional %>% subset(.,p6220>=4) %>%  group_by(dpto.x,mes,periodo) %>% summarise(total = sum(fex_c_2011.x)) %>% as.data.frame()
tasa = merge(x = educacion,y = poblacion,by = c('dpto.x','mes','periodo'),all.x = T)
tasa = mutate(tasa,porcentaje=(total/pob)*100)
tasa = mutate(tasa,x10=(total/pob)*100000)
tasa = aggregate(tasa,by = list(tasa$dpto.x,tasa$periodo), mean)
tasa$periodo=tasa$Group.2
tasa = tasa[,-c(1,2,4)]
tasa = dcast(setDT(tasa),formula = dpto.x~periodo,value.var = c('porcentaje','pob','total','x10'))
tasa$dpto.x = ifelse(tasa$dpto.x=='5','05',ifelse(tasa$dpto.x=='8','08',tasa$dpto.x))

# 2. Mapas ----------------------------------------------------------------
rm(analfabetismo,des,educacion,ina,pea,pet,desempleo)
path = '/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres/task-2/data/Original 2'
mapa = st_read(path)

mapa_illiteracy = merge(x = mapa,y = tasa_illite,by.x = 'DPTO',by.y = 'dpto.x',all.x=T)
tasa_illite = merge(x = mapa,y = tasa_illite,by.x = 'DPTO',by.y = 'dpto.x',all.y=T)
tasa_illite$NOMBRE_DPT = as.character(tasa_illite$NOMBRE_DPT)
tasa_illite$NOMBRE_DPT = str_to_title(tasa_illite$NOMBRE_DPT)
tasa_illite$NOMBRE_DPT = ifelse(tasa_illite$NOMBRE_DPT=='Santafe De Bogota D.c','Bogota D.C',ifelse(tasa_illite$NOMBRE_DPT=='Norte De Santander','N. Santander',ifelse(tasa_illite$NOMBRE_DPT=='Valle Del Cauca','V. Cauca',tasa_illite$NOMBRE_DPT)))
mapa_graduados  = merge(x = mapa,y = tasa,by.x = 'DPTO',by.y = 'dpto.x',all.x=T)
tasa = merge(x = mapa,y = tasa,by.x = 'DPTO',by.y = 'dpto.x',all.y=T)
tasa$NOMBRE_DPT = as.character(tasa$NOMBRE_DPT)
tasa$NOMBRE_DPT = str_to_title(tasa$NOMBRE_DPT)
tasa$NOMBRE_DPT = ifelse(tasa$NOMBRE_DPT=='Santafe De Bogota D.c','Bogota D.C',ifelse(tasa$NOMBRE_DPT=='Norte De Santander','N. Santander',ifelse(tasa$NOMBRE_DPT=='Valle Del Cauca','V. Cauca',tasa$NOMBRE_DPT)))

ggplot(tasa) + geom_bar(aes(x = NOMBRE_DPT, y = porcentaje_2019),stat = "identity",position=position_dodge())+
                      scale_x_discrete(guide = guide_axis(angle = 45)) +
                      theme(legend.position="right")+ theme_bw()+
                      labs(title = "Tasa de graduados de eduación superior", subtitle = 'Departamental - Promedio 2019',
                           y = "Tasa (%)",x = "Departamento")+
                      theme(plot.title = element_text(hjust = 0.5,size = 10),
                            plot.subtitle = element_text(hjust = 0.5,size = 8),
                            panel.grid.minor = element_line(size = 0.15),
                            panel.grid.major = element_line(size = 0.15),
                            legend.title = element_text(size=7),
                            legend.text = element_text(size=7),
                            axis.title.y = element_text(size = 6),
                            axis.title.x = element_text(size = 6),
                            axis.text = element_text(size = 6))
ggsave(filename = '/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres-R/Taller 2/Resultados/educacion.jpeg',width = 16,height = 8,units = "cm")

ggplot(tasa_illite) + geom_bar(aes(x = NOMBRE_DPT, y = porcentaje_2019),stat = "identity",position=position_dodge())+
                      scale_x_discrete(guide = guide_axis(angle = 45)) +
                      theme(legend.position="right")+ theme_bw()+
                      labs(title = "Tasa de analfabetismo", subtitle = 'Departamental - Promedio 2019',
                           y = "Tasa (%)",x = "Departamento")+
                      theme(plot.title = element_text(hjust = 0.5, size = 10),
                            plot.subtitle = element_text(hjust = 0.5,size = 8),
                            panel.grid.minor = element_line(size = 0.15),
                            panel.grid.major = element_line(size = 0.15),
                            legend.title = element_text(size=7),
                            legend.text = element_text(size=7),
                            axis.title.y = element_text(size = 6),
                            axis.title.x = element_text(size = 6),
                            axis.text = element_text(size = 6))
ggsave(filename = '/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres-R/Taller 2/Resultados/analfabetismo.jpeg',width = 16,height = 8,units = "cm")

ggplot() + geom_sf(data = mapa_illiteracy, color='black',aes(fill=porcentaje_2019),size=0.5)+
           scale_fill_viridis(name = "Tasa", na.value = "gray",direction = 1)+
          theme_bw()+ coord_sf()+
          labs(title = "Tasa de analfabetismo",subtitle  = 'Departamental - Promedio 2019')+
          annotation_scale(location = "bl", width_hint = 0.5) +
          annotation_north_arrow(location = "bl", which_north = "true", 
                                 pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                                 style = north_arrow_fancy_orienteering) +
          theme(axis.title = element_blank(),
                axis.text = element_blank(),
                plot.title = element_text(hjust = 0.5, size = 10),
                plot.subtitle = element_text(hjust = 0.5,size = 8),
                axis.ticks = element_blank(),
                panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(),
                panel.background = element_rect(fill = "#E8D7BF"))
ggsave(filename =  '/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres-R/Taller 2/Resultados/mapa_analfabetismo.jpeg',width = 14,height = 18,units = "cm")

ggplot() + geom_sf(data = mapa_graduados, color='black',aes(fill=porcentaje_2019),size=0.5)+
            scale_fill_viridis(name="Tasa",na.value = "gray",direction = 1)+
            theme_bw()+ coord_sf()+
            labs(title = "Tasa de analfabetismo",subtitle  = 'Departamental - Promedio 2019')+
            annotation_scale(location = "bl", width_hint = 0.5) +
            annotation_north_arrow(location = "bl", which_north = "true", 
                                   pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                                   style = north_arrow_fancy_orienteering) +
            theme(axis.title = element_blank(),
                  plot.title = element_text(hjust = 0.5, size = 10),
                  plot.subtitle = element_text(hjust = 0.5,size = 8),
                  axis.text = element_blank(),
                  axis.ticks = element_blank(),
                  panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(),
                  panel.background = element_rect(fill = "#E8D7BF"))
ggsave(filename =  '/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres-R/Taller 2/Resultados/mapa_graduados.jpeg',width = 14,height = 18,units = "cm")

ingresos = nacional[,c(4,5,9,12,37,40,266)] %>% subset(is.na(inglabo)==F&p6040>=18&p6040<=28) %>% 
  group_by(mes,dpto.x,periodo) %>% as.data.frame() 
ingresos$urbano.x=as.character(ingresos$urbano.x)
ingresos = ingresos %>% group_by(mes,p6020,urbano.x,periodo) %>% summarise(promedio=mean(inglabo,na.rm=T)) %>% as.data.frame() %>% 
  reshape2::dcast(.,formula = mes+urbano.x+periodo~p6020,value.var = 'promedio')
ingresos = mutate(ingresos,brecha=`1`-`2`)
ggplot(data = ingresos,aes(x = mes,y =brecha,group=urbano.x,fill=urbano.x)) + 
            geom_bar(stat = "identity",position = position_dodge())+theme_bw()+
            scale_fill_brewer("Nivel",labels = c("Cabecera", "Resto"))

