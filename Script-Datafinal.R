
#MergeFinalData
library(rio)
#Importar
LinkUrbano="https://github.com/fiorelabarbaran/Trabajo/raw/master/urbano.csv"
Urbano=import(LinkUrbano)

LinkRiqueza="https://raw.githubusercontent.com/Alisson2406/Trabajo-final-de-estadistica/master/Riqueza.csv"
Riqueza=import(LinkRiqueza)


LinkEducacion="https://raw.githubusercontent.com/Giancarlo-Ramirez/Estad-stica-2---Teor-a/master/EducacionFinal.csv"
Educacion=import(LinkEducacion)

LinkDemocracia="https://raw.githubusercontent.com/AlonsoAbarca/TrabajoFinal_Estadistica2/master/Democraciafinal.csv"
Democracia=import(LinkDemocracia)


Datafinal=merge(Democracia,Educacion)
Datafinal=merge(Datafinal,Riqueza)
Datafinal=merge(Datafinal,Urbano)
write.csv(Datafinal,"Datafinal.csv", row.names = F)
