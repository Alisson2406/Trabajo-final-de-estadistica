link="https://raw.githubusercontent.com/Alisson2406/Trabajo-final-de-estadistica/master/Datafinal.csv"
data=import(link)
#Omitimos los NA
data$Puntuación=NULL
data$Continente=NULL
data$Alfabetizacion=NULL
data$`Gasto Publico`=NULL
data$'2018_med'=NULL
data=na.omit(data)

