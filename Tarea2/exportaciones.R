library(stringr)
library(readxl)
library(tidyverse)
source("mismacros.txt")


exportaciones = read_excel("exportaciones.xlsx")

# exportaciones2018 = subset(exportaciones, str_detect(Ano, "2018"), select=c(Mes, Producto, Valor, Volumen))
exportaciones2018cafe = subset(exportaciones, str_detect(Ano, "2018") & str_detect(Producto, "Café"), select=c(Mes, Valor, Volumen))


mytable(Volumen ~ Mes,data=exportaciones2018cafe,ord="levels")

#Basado en los valores anteriores de la función mytable, se tiene que:
cat("El porcentaje del valor de las exportaciones de café en 2018 que se hicieron durante 
    el mes de agosto corresponde a 9.25%")

cat("El porcentaje del valor de las exportaciones de café en 2018 que se hicieron durante 
    el primer trimestre corresponde a 26.6%")


mytable(Valor ~ Mes,data=exportaciones2018cafe,ord="-levels")

#Basado en los valores anteriores de la función mytable, se tiene que:
cat("El porcentaje del valor de las exportaciones de café en 2018 que se hicieron durante 
    el mes de septiembre corresponde a 7.63%")

cat("El porcentaje del valor de las exportaciones de café en 2018 que se hicieron durante 
    el último trimestre corresponde a 25.65%")

exportaciones2019flores = subset(exportaciones, str_detect(Ano, "2019") & str_detect(Producto, "Flores"), 
                                 select=c(Mes, Departamento, Valor, Volumen))


mytable(Volumen ~ Departamento*Mes,data=exportaciones2019flores,ord="levels")

volExpdeAntioquia =  9.31+9.59+7.25
cat("El porcentaje del volumen de las exportaciones de flores en Antioquia en 2019 que se hicieron
    durante el primer trimestre del año corresponde a: ", volExpdeAntioquia)


volExp1Trimestre = (34.09+27.18+21.88)/3
cat("El porcentaje del volumen de las exportaciones de flores en 2019 que se hicieron
    durante el primer trimestre del año desde Antioquia corresponde a: ", volExp1Trimestre)


mytable(Valor ~ Departamento*Mes,data=exportaciones2019flores,ord="levels")

valExpenAntioquia3Trim = 8.49+7.22+7.38
cat("El porcentaje del valor de las exportaciones de flores en Antioquia en 2019 que se hicieron
    durante el tercer trimestre del año corresponde a: ", valExpdeAntioquia3Trim)


valExp3TrimDesdeAntioquia = (21.53+15.38+21.49)/3
cat("El porcentaje del valor de las exportaciones de flores en 2019 que se hicieron
durante el tercer trimestre desde Antioquia del año corresponde a: ", valExp3TrimDesdeAntioquia)
