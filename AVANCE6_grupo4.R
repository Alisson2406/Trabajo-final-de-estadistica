library(rio)
Link="https://raw.githubusercontent.com/AlonsoAbarca/TrabajoFinal_Estadistica2/master/datafinalav5.csv"
datafinal=import(Link)
#Renombrar
names(datafinal)=c("pais","pobaglo","pobciudad","conta","electoral","funcionamiento","participacion","cultura","derechosciv","años","desempleo","celulares","pbi","infla")
#limpieza final
datafinal$años=as.numeric(datafinal$años)
datafinal$conta=NULL
datafinal$desempleo=NULL
#dataop
dataop=datafinal
dataop$pais=NULL
#Factorización
corMatrix=polycor::hetcor(dataop)$correlations
#Redimensionar
sugerencia=parameters::n_factors(corMatrix)
plot(sugerencia)
resfa <- fa(dataop,nfactors = 4,cor = 'mixed',rotate = "varimax",fm="minres")
fa.diagram(resfa)

#Construir indices según resultados de factorización
model <- ' democracia  =~ electoral + derechosciv + funcionamiento + participacion + cultura
           urban =~ pobaglo + pobciudad + celulares
           educa =~ años
           riqueza   =~ infla + pbi'
          
#Cambiando de escala
datascale=scale(datafinal[,-1])
cfa_fit <- cfa(model, data=dataop, 
               std.lv=TRUE,  
               missing="fiml")

#añadir a datafinal
datafinal=as.data.frame(cbind(datafinal,lavPredict(cfa_fit)))
#regresión
modelo1=lm(democracia~urban+riqueza+educa,data = datafinal)
summary(modelo1)
#Ecuación
Democracia = 0.665(riqueza)+0.280(educa)

#Pruebas al modelo
#Linealidad
plot(modelo1, 1)
#No Homocedasticidad
library(lmtest)
bptest(modelo1)
#Prueba de normalidad de residuos
shapiro.test(modelo1$residuals)
#No multicolinealidad
VIF(modelo1)
#sí pasa porque todos los resultados son menores que 5
#Prueba de valores influyentes
checkreg1=as.data.frame(influence.measures(modelo1)$is.inf)
checkreg1[checkreg1$cook.d | checkreg1$hat,]
plot(modelo1,5)
