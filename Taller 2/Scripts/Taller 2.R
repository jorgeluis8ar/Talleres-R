# Codigo creado por: Jorge Luis Ochoa Rincon
# Codigo: 201711018
# Taller de R - Task 1

# Limpiando la consola y cargando paquetes --------------------------------

cat("\f")
rm(list=ls())
options("scipen"=100, "digits"=4)
setwd("/Users/jorgeochoa/Documents/Universidad/Taller de R/Taller 2")

paquetes=c("tidyverse","data.table","ggplot2",'viridis','sf','ggspatial','dplyr')

lapply(paquetes,require,character.only=T)
rm(paquetes)

# 1.1 Descargar la base de datos ----------------------------------------------

# 1.2 Importanto las bases de datos -------------------------------------------

meses = list.files('Datos') %>% paste0('Datos/',.,'/')
files = lapply(1:length(meses),function(x) list.files(meses[x]) %>% paste0(meses[x],.))  %>% unlist()
files

f_read = function(path){
  data = read.csv(file = path , sep = ';')
  colnames(data) = tolower(colnames(data))
  archivo = substr(path,start = str_locate(path,'Datos/')[2]+1,str_locate(files[1],'.csv')[1]-1)
  data = mutate(data, mes = archivo)
  data$fex_c_2011 = as.character(data$fex_c_2011) %>% str_replace(.,',','.') %>% as.numeric()
  return(data)
}

lista_archivos = files[c(grep('Cabecera',files),
                         grep('Resto',files))] %>% 
                  .[c(grep('Caracter',.),
                      grep('Desocupados',.),
                      grep('Inactivos',.),
                      grep('Ocupados',.),
                      grep('Fuerza',.))]

lista_data = lapply(lista_archivos, function(x) f_read(path = x))


carac_general = plyr::rbind.fill(lista_data[1:12] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1),
                                 lista_data[13:24] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0))
carac_general %>% group_by(carac_general$mes) %>% summarise(total=sum(fex_c_2011)) %>% as.data.frame()

duplicated(paste0(carac_general$secuencia_p,carac_general$directorio,carac_general$orden,carac_general$mes)) %>% table()
desocupado = plyr::rbind.fill(lista_data[25:36] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(desocupado=1),
                              lista_data[37:48] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0) %>% mutate(desocupado=1))

inactivo = plyr::rbind.fill(lista_data[49:60] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(inanctivo=1),
                            lista_data[61:72] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0) %>% mutate(inanctivo=1))

ocupado = plyr::rbind.fill(lista_data[73:84] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(ocupado=1),
                           lista_data[85:96] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0) %>% mutate(ocupado=1))

fuerza = plyr::rbind.fill(lista_data[97:108] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 1) %>% mutate(fuerza=1),
                          lista_data[109:120] %>% data.table::rbindlist(use.names = T,fill = T) %>% mutate(urbano = 0)%>% mutate(fuerza=1))

# 1.3 Uniendo las bases de datos ------------------------------------------

nacional = merge(x = carac_general,y = desocupado,by = c('secuencia_p','directorio','orden','mes'),all.x = T) %>% 
           merge(x = .,y = inactivo,by = c('secuencia_p','directorio','orden','mes'),all.x = T) %>% 
           merge(x = .,y = ocupado,by = c('secuencia_p','directorio','orden','mes'),all.x = T,suffixes = c('_cg','_ocu')) %>% 
           merge(x = .,y = fuerza,by = c('secuencia_p','directorio','orden','mes'),all.x = T,suffixes = c('_cg','_fuer'))
nacional %>% group_by(nacional$mes) %>% summarise(total=sum(fex_c_2011.x,na.rm=T)) %>% as.data.frame()
rm(lista_data,carac_general,inactivo,ocupado,fuerza,desocupado)
# 1.4 Descriptivas --------------------------------------------------------

pet = nacional %>% subset(fuerza==1) %>% group_by(mes) %>% summarise(pet=sum(fex_c_2011.x)) 
ina = nacional %>% subset(inanctivo==1) %>% group_by(mes) %>% summarise(ina=sum(fex_c_2011)) 
des = nacional %>% subset(desocupado==1) %>% group_by(mes) %>% summarise(des=sum(fex_c_2011.x))
pea=pet[,2]-ina[,2]
unemployment=(des[,2]/pea)*100


poblacion = nacional %>% subset(.,is.na(dpto.x)==F) %>%  group_by(dpto.x,mes) %>% summarise(pob=sum(fex_c_2011.x,na.rm=T)) %>% as.data.frame()
analfabetismo = nacional %>% subset(.,p6160==2&is.na(dpto.x)==F) %>%  group_by(dpto.x,mes) %>% summarise(total = sum(fex_c_2011.x)) %>% as.data.frame()
tasa_illite = merge(x = analfabetismo,y = poblacion,by = c('dpto.x','mes'),all.x =T )
tasa_illite = mutate(tasa_illite,porcentaje=(total/pob)*100)
tasa_illite = aggregate(tasa_illite,by = list(tasa_illite$dpto.x), mean)
tasa_illite = tasa_illite[,-c(1,3)]
tasa_illite$dpto.x = as.character(tasa_illite$dpto.x)
tasa_illite$dpto.x = ifelse(tasa_illite$dpto.x=='5','05',ifelse(tasa_illite$dpto.x=='8','08',tasa_illite$dpto.x))

educacion = nacional %>% subset(.,p6220>=4) %>%  group_by(dpto.x,mes) %>% summarise(total = sum(fex_c_2011.x)) %>% as.data.frame()
tasa = merge(x = educacion,y = poblacion,by.x = c('dpto','mes'),by.y = c('dpto.x','mes'),all.x = T)
tasa = mutate(tasa,porcentaje=(total/pob)*100)
tasa = aggregate(tasa,by = list(tasa$dpto.x), mean)
tasa = tasa[,-c(1,3)]
tasa$dpto.x = as.character(tasa$dpto.x)
tasa$dpto.x = ifelse(tasa$dpto.x=='5','05',ifelse(tasa$dpto.x=='8','08',tasa$dpto.x))

poblacion = poblacion %>% dplyr::filter(mes=='Dicie') %>% mutate(.,pobtotal=sum(pob,na.rm=T))
poblacion = mutate(poblacion,porcentaje=(pob/pobtotal)*100)
# 2. Mapas ----------------------------------------------------------------
rm(analfabetismo,des,educacion,ina,pea,pet,unemployment)
path = '/Users/jorgeochoa/Documents/Universidad/Taller de R/Talleres/task-2/data/Original 2'
mapa = st_read(path)

mapa_illiteracy = merge(x = mapa,y = tasa_illite,by.x = 'DPTO',by.y = 'dpto.x',all.x=T)
mapa_graduados  = merge(x = mapa,y = tasa,by.x = 'DPTO',by.y = 'dpto.x',all.x=T)

ggplot() + geom_sf(data = mapa_illiteracy, color='black',aes(fill=porcentaje),size=0.5)+
           scale_fill_viridis(name="Porcentaje",na.value = "gray",direction = 1)+
          theme_void()+ coord_sf()+
          annotation_scale(location = "bl", width_hint = 0.5) +
          annotation_north_arrow(location = "bl", which_north = "true", 
                                 pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                                 style = north_arrow_fancy_orienteering) +
          theme(axis.title = element_blank(),
                panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(),
                panel.background = element_rect(fill = "#E8D7BF"))

ggplot() + geom_sf(data = mapa_graduados, color='black',aes(fill=porcentaje),size=0.5)+
  scale_fill_viridis(name="Porcentaje",na.value = "gray",direction = 1)+
  theme_void()+ coord_sf()+
  annotation_scale(location = "bl", width_hint = 0.5) +
  annotation_north_arrow(location = "bl", which_north = "true", 
                         pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering) +
  theme(axis.title = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#E8D7BF"))

ingresos = nacional[,c(4,11,36,265)] %>% subset(is.na(inglabo)==F&p6040>=18&p6040<=28) %>% 
  group_by(mes,dpto.x) %>% as.data.frame() 
ingresos = subset(ingresos, inglabo<=15000000)
ggplot(ingresos) + geom_density(aes(x = inglabo, color = mes))+
  scale_color_viridis_d()+theme_bw()



