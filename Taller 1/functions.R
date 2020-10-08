geih <- function(path_file){
  base=read.csv2(file =path_file, header = T,sep=';')
  colnames(base)=tolower(colnames(base))
  archivo = substr(path_file,str_locate(path_file,'Junio 2019/')[2]+1,str_locate(path_file,'-')-2)
  base$nivel=archivo
  indica = substr(path_file,str_locate(path_file,'-')+2,str_locate(path_file,'.csv')[1]-1)
  print(paste0(archivo,' - ',indica,' 2019'))
  base$indicador=indica

    if (indica=="Caracteristicas generales (Personas)"){
      nombres=c(grep('secuencia_p',colnames(base)),
                grep('orden',colnames(base)),
                grep('directorio',colnames(base)),
                grep('p6020',colnames(base)),
                grep('p6040',colnames(base)),
                grep('p6030s1',colnames(base)),
                grep('p6440',colnames(base)),
                grep('p6450',colnames(base)),
                grep('p6920',colnames(base)),
                grep('inglabo',colnames(base)),
                grep('dpto',colnames(base)),
                grep('fex_c_2011',colnames(base)),
                grep('esc',colnames(base)),
                grep('mes',colnames(base)),
                grep('p6050',colnames(base)),
                grep('indicador',colnames(base)),
                grep('nivel',colnames(base))
      )
      base=base[,nombres]
      names(base)[names(base) == "nivel"] <- paste0(archivo,"-",substr(indica,1,2))
      names(base)[names(base) == "indicador"] <- substr(indica,1,3)
    }
  else{
    nombres=c(grep('secuencia_p',colnames(base)),
              grep('orden',colnames(base)),
              grep('directorio',colnames(base)),
              grep('indicador',colnames(base)),
              grep('nivel',colnames(base)),
              grep('inglabo',colnames(base)),
              grep('p6440',colnames(base)),
              grep('p6450',colnames(base)),
              grep('p6920',colnames(base)),
              grep('p6500',colnames(base)),
              grep('p6750',colnames(base))
    )
    base=base[,nombres]
    names(base)[names(base) == "nivel"] <- paste0(archivo,"-",substr(indica,1,2))
    names(base)[names(base) == "indicador"] <- substr(indica,1,3)
    names(base)[names(base) == "p6500"] <- "inglabo"
    names(base)[names(base) == "p6750"] <- "inglabodes"
    }
  return(base)
}

geih3 <- function(path_file){
  base=read.csv2(file =path_file, header = T,sep=';')
  colnames(base)=tolower(colnames(base))
  archivo = substr(path_file,str_locate(path_file,'Junio2 2020/')[2]+1,str_locate(path_file,'-')-2)
  base$nivel=archivo
  indica = substr(path_file,str_locate(path_file,'-')+2,str_locate(path_file,'.csv')[1]-1)
  print(paste0(archivo,' - ',indica,' 2020'))
  base$indicador=indica
  if (indica=="Caracteristicas generales (Personas)"){
    nombres=c(grep('secuencia_p',colnames(base)),
              grep('orden',colnames(base)),
              grep('directorio',colnames(base)),
              grep('p6020',colnames(base)),
              grep('p6040',colnames(base)),
              grep('p6030s1',colnames(base)),
              grep('p6440',colnames(base)),
              grep('p6450',colnames(base)),
              grep('p6920',colnames(base)),
              grep('inglabo',colnames(base)),
              grep('dpto',colnames(base)),
              grep('fex_c_2011',colnames(base)),
              grep('esc',colnames(base)),
              grep('mes',colnames(base)),
              grep('p6050',colnames(base)),
              grep('indicador',colnames(base)),
              grep('nivel',colnames(base))
    )
    base=base[,nombres]
    names(base)[names(base) == "nivel"] <- paste0(archivo,"-",substr(indica,1,2))
    names(base)[names(base) == "indicador"] <- substr(indica,1,3)
  }
  else{
    nombres=c(grep('secuencia_p',colnames(base)),
              grep('orden',colnames(base)),
              grep('directorio',colnames(base)),
              grep('indicador',colnames(base)),
              grep('nivel',colnames(base)),
              grep('inglabo',colnames(base)),
              grep('p6440',colnames(base)),
              grep('p6450',colnames(base)),
              grep('p6920',colnames(base)),
              grep('p6500',colnames(base)),
              grep('p6750',colnames(base))
    )
    base=base[,nombres]
    names(base)[names(base) == "nivel"] <- paste0(archivo,"-",substr(indica,1,2))
    names(base)[names(base) == "indicador"] <- substr(indica,1,3)
    names(base)[names(base) == "p6500"] <- "inglabo"
    names(base)[names(base) == "p6750"] <- "inglabodes"
  }
  return(base)
}


geih2 <- function(path_file){
  base=readRDS(file =path_file,refhook = NULL)
  colnames(base)=tolower(colnames(base))
  nombres=c(grep('secuencia_p',colnames(base)),
            grep('orden',colnames(base)),
            grep('directorio',colnames(base)),
            grep('p6020',colnames(base)),
            grep('p6040',colnames(base)),
            grep('p6030s1',colnames(base)),
            grep('p6440',colnames(base)),
            grep('p6450',colnames(base)),
            grep('p6920',colnames(base)),
            grep('inglabo',colnames(base)),
            grep('dpto',colnames(base)),
            grep('fex_c_2011',colnames(base)),
            grep('esc',colnames(base)),
            grep('mes',colnames(base)),
            grep('p6050',colnames(base))
  )
  
  base=base[,nombres]
  base=mutate(base,indicador=(substr(path_file,str_locate(path_file,'Junio 2020/')[2],str_locate(path_file,'.rds'))))
  base=mutate(base,nivel=(substr(base$indicador,2,str_locate(base$indicador,"-")-1)))
  base$indicador=substr(base$indicador,str_locate(base$indicador,'-')+1,nchar(base$indicador)-1)
  base=mutate(base,periodo=2020)
  return(base)
}

