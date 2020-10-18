data=Datafinal
data$Puntuación=NULL
data$Continente=NULL
data$Alfabetizacion=NULL
data$`Gasto Publico`=NULL
data$`Maestros Capacitados`=NULL
data=na.omit(data)
#Añadimos una columna mas
linkeducacion2="https://github.com/Giancarlo-Ramirez/BBDD-Educaci-n/raw/main/Duracion.csv"
Educación=import(linkeducacion2)
data=merge(data,Educación)

#Analisis UNIVARIADO
#Inflación
install.packages("DescTools")
library(DescTools)
Median(data$inflación)
mean(data$inflación)
summary(data$inflación)

sd(data$inflación)
var(data$inflación) 
rango=max(data$inflación)-min(data$inflación) 
rango
install.packages("e1071")
library(e1071)
skewness(data$inflación) #positiva
hist(data$inflación)

##Pbi
library(DescTools)
Median(data$pbi)
mean(data$pbi)
summary(data$pbi)

sd(data$pbi)
var(data$pbi) 
rango=max(data$pbi)-min(data$pbi) 
rango
library(e1071)
skewness(data$pbi)#negativa
boxplot(data$pbi)

##Celulares
library(DescTools)
Median(data$celulares)
mean(data$celulares)
summary(data$celulares)

sd(data$celulares)
var(data$celulares) 
rango=max(data$celulares)-min(data$celulares) 
rango
library(e1071)
skewness(data$celulares)#negativa
hist(data$celulares) 

#Analisis multivariado
#Celulares Y Población Rural
plot(data$celulares, data$PobRural)
plot(data$celulares, data$PobRural, xlab = "Celulares", ylab = "Población arural")
*Ho: Las variables son estadísticamente independientes
*Ha: Las variables son estadísticamente dependientes
cor.test(data$celulares, data$PobRural)

#PBI y Funcionamiento del gobierno
plot(data$pbi, data$`Funcionamientodel gobierno`)
plot(data$pbi, data$`Funcionamientodel gobierno`, xlab = "PBI", ylab = "Funcionamineto del Gobierno")
*Ho: Las variables son estadísticamente independientes
*Ha: Las variables son estadísticamente dependientes
cor.test(data$pbi, data$`Funcionamientodel gobierno`)

#Inflación y Crecimiento poblacional Urbano
plot(data$inflación, data$CrecimientoPobUrb)
plot(data$inflación, data$CrecimientoPobUrb, xlab = "Inflación", ylab = "Creciemiento Poblacional Urbano")
*Ho: Las variables son estadísticamente independientes
*Ha: Las variables son estadísticamente dependientes
cor.test(data$inflación, data$CrecimientoPobUrb)
