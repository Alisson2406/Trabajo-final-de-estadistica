
library(rio)
lkXLSX="https://github.com/Alisson2406/Trabajo-final-de-estadistica/raw/master/inflacion-sucio.xls"
datainflacion=import(lkXLSX)
lkXLSX="https://github.com/Alisson2406/Trabajo-final-de-estadistica/raw/master/celulares-sucio.xls"
datacelulares=import(lkXLSX)
lkXLSX="https://github.com/Alisson2406/Trabajo-final-de-estadistica/raw/master/pbi-sucio.xls"
datapbi=import(lkXLSX)

datainflacion=datainflacion[,-c(5:62)]
names(datainflacion)=c("País","x2","x3","x4","inflacion","x5")
datainflacion$x2=NULL
datainflacion$x3=NULL
datainflacion$x4=NULL
datainflacion$x5=NULL
str(datainflacion)
names(datainflacion)=c("País","inflación","eliminar")
datainflacion$eliminar=NULL

datainflacion=datainflacion[-c(1:2),]
datainflacion$inflación=as.numeric(datainflacion$inflación)
datainflacion[!complete.cases(datainflacion),]
datainflacion=na.omit(datainflacion)

datacelulares=datacelulares[,-c(5:62)]
names(datacelulares)=c("País","x2","x3","x4","celulares","x5","x6")
datacelulares$x2=NULL
datacelulares$x3=NULL
datacelulares$x4=NULL
datacelulares$x5=NULL
datacelulares$x6=NULL
str(datacelulares)

datacelulares=datacelulares[-c(1:3),]
datacelulares$celulares=as.numeric(datacelulares$celulares)
datacelulares[!complete.cases(datacelulares),]
datacelulares=na.omit(datacelulares)

datapbi=datapbi[,-c(5:62)]
names(datapbi)=c("País","x2","x3","x4","pbi","x5","x6")
datapbi$x2=NULL
datapbi$x3=NULL
datapbi$x4=NULL
datapbi$x5=NULL
datapbi$x6=NULL

datapbi=datapbi[-c(1:3),]
datapbi$pbi=as.numeric(datapbi$pbi)
datapbi[!complete.cases(datapbi),]
datapbi=na.omit(datapbi)
write.csv(datapbi,"pbi.csv", row.names = F)

names(datapbi)=c("País","pbi")
names(datainflacion)=c("País","inflación")
names(datacelulares)=c("País","celulares")
RIQUEZA=merge(datainflacion,datapbi)
RIQUEZA=merge(RIQUEZA,datacelulares)
write.csv(RIQUEZA,"RIQUEZA.csv", row.names = F)

