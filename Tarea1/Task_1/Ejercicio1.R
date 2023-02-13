#Lo primero es identificar la extencion de los archivos que trabajaremos.
#Al percatarnos que son .xlsx, usaremos la libreria:

library(readxl)

# Cabe aclarar que de ante mano, es preciso setear nuestro directorio de 
# trabajo, por ende dejamos la siguiente línea comentada para realizar esta 
# acción. 

# setwd("Directorio de Trabajo")

#Realizamos la lectura, considerando:

#TL = Tiros del equipo local
#TV = Tiros del equipo visitante
#TPL = Tiros a puerta del equipo local
#TPV = Tiros al arco del equipo visitante
#FAL = Faltas cometidas por el equipo local
#FAV = Faltas cometidas por el equipo visitante
#FUL= Fuera de juego del equipo local
#FUV = Fuera de juego del equipo visitante
#TAL = Tarjetas amarillas del equipo local
#TAV = Tarjetas amarillas del equipo visitante
#TRL = Tarjetas rojas del equipo local
#TRV = Tarjetas rojas del equipo visitante

#     season-1415.xlsx_______________________________________________________________________________ 

season1415 <- read_excel("season-1415.xlsx", sheet = 1, skip = 1,
                         col_names = c("Temporada","Fecha","Equipo Local","Equipo Visitante",
                                       "Goles del equipo local a tiempo completo",
                                       "Goles del equipo visitante a tiempo completo",
                                       "Arbitro","TL","TV","TPL","TPV","FAL",
                                       "FAV","FUL","FUV","TAL","TAV",
                                       "TRL","TRV"),
                         col_types = c("text","date","text","text",
                                       "numeric",
                                       "numeric","skip","skip","skip","skip",
                                       "text","numeric","numeric","numeric","numeric","numeric",
                                       "numeric","numeric","numeric","numeric","numeric",
                                       "numeric","numeric"))

#     season-1516.xlsx________________________________________________________________________________ 

season1516 <- read_excel("season-1516.xlsx", sheet = 1, skip = 1,
                         col_names = c("Temporada","Fecha","Equipo Local","Equipo Visitante",
                                       "Goles del equipo local a tiempo completo",
                                       "Goles del equipo visitante a tiempo completo",
                                       "Arbitro","TL","TV","TPL","TPV","FAL",
                                       "FAV","FUL","FUV","TAL","TAV",
                                       "TRL","TRV"),
                         col_types = c("text","date","text","text",
                                       "numeric",
                                       "numeric","skip","skip","skip","skip",
                                       "text","numeric","numeric","numeric","numeric","numeric",
                                       "numeric","numeric","numeric","numeric","numeric",
                                       "numeric","numeric"))

#     season-1617.xlsx_______________________________________________________________________________ 

season1617 <- read_excel("season-1617.xlsx", sheet = 1, skip = 1,
                         col_names = c("Temporada","Fecha","Equipo Local","Equipo Visitante",
                                       "Goles del equipo local a tiempo completo",
                                       "Goles del equipo visitante a tiempo completo",
                                       "Arbitro","TL","TV","TPL","TPV","FAL",
                                       "FAV","FUL","FUV","TAL","TAV",
                                       "TRL","TRV"),
                         col_types = c("text","date","text","text",
                                       "numeric",
                                       "numeric","skip","skip","skip","skip",
                                       "text","numeric","numeric","numeric","numeric","numeric",
                                       "numeric","numeric","numeric","numeric","numeric",
                                       "numeric","numeric"))

#     season-1718.xlsx_______________________________________________________________________________

season1718 <- read_excel("season-1718.xlsx", sheet = 1, skip = 1,
                         col_names = c("Temporada","Fecha","Equipo Local","Equipo Visitante",
                                       "Goles del equipo local a tiempo completo",
                                       "Goles del equipo visitante a tiempo completo",
                                       "Arbitro","TL","TV","TPL","TPV","FAL",
                                       "FAV","FUL","FUV","TAL","TAV",
                                       "TRL","TRV"),
                         col_types = c("text","date","text","text",
                                       "numeric",
                                       "numeric","skip","skip","skip","skip",
                                       "text","numeric","numeric","numeric","numeric","numeric",
                                       "numeric","numeric","numeric","numeric","numeric",
                                       "numeric","numeric"))

#     season-1819.xlsx_______________________________________________________________________________

season1819 <- read_excel("season-1819.xlsx", sheet = 1, skip = 1,
                         col_names = c("Temporada","Fecha","Equipo Local","Equipo Visitante",
                                       "Goles del equipo local a tiempo completo",
                                       "Goles del equipo visitante a tiempo completo",
                                       "Arbitro","TL","TV","TPL","TPV","FAL",
                                       "FAV","FUL","FUV","TAL","TAV",
                                       "TRL","TRV"),
                         col_types = c("text","date","text","text",
                                       "numeric",
                                       "numeric","skip","skip","skip","skip",
                                       "text","numeric","numeric","numeric","numeric","numeric",
                                       "numeric","numeric","numeric","numeric","numeric",
                                       "numeric","numeric"))

# NUMERO DE VARIABLES QUE CONTIENE CADA CONJUNTO DE DATOS Y SU TIPO DE DATO:

#Season1415

column_names14 = colnames(season1415)
column_types14 = sapply(season1415, class)

#Realizamos un ciclo que recorra cada columna, imprimiendo el nombre de la variable y el tipo de dato que tiene
for (i in 1:length(column_names14)) {
  cat("La variable: ", column_names14[[i]], ", es de tipo: ", column_types14[[i]] ,  ".\n")
}
cat("Obteniendo asi un total de:",i," variables registradas.")

#Season1516

column_names15 = colnames(season1516)
column_types15 = sapply(season1516, class)

#Realizamos un ciclo que recorra cada columna, imprimiendo el nombre de la variable y el tipo de dato que tiene
for (i in 1:length(column_names15)) {
  cat("La variable: ", column_names15[[i]], ", es de tipo: ", column_types15[[i]] ,  ".\n")
}
cat("Obteniendo asi un total de:",i," variables registradas.")

#Season1617

column_names16 = colnames(season1617)
column_types16 = sapply(season1617, class)

#Realizamos un ciclo que recorra cada columna, imprimiendo el nombre de la variable y el tipo de dato que tiene
for (i in 1:length(column_names16)) {
  cat("La variable: ", column_names16[[i]], ", es de tipo: ", column_types16[[i]] ,  ".\n")
}
cat("Obteniendo asi un total de:",i," variables registradas.")

#Season1718

column_names17 = colnames(season1718)
column_types17 = sapply(season1718, class)

#Realizamos un ciclo que recorra cada columna, imprimiendo el nombre de la variable y el tipo de dato que tiene
for (i in 1:length(column_names17)) {
  cat("La variable: ", column_names17[[i]], ", es de tipo: ", column_types17[[i]] ,  ".\n")
}
cat("Obteniendo asi un total de:",i," variables registradas.")

#Season1819

column_names18 = colnames(season1819)
column_types18 = sapply(season1819, class)

#Realizamos un ciclo que recorra cada columna, imprimiendo el nombre de la variable y el tipo de dato que tiene

for (i in 1:length(column_names18)) {
  cat("La variable: ", column_names18[[i]], ", es de tipo: ", column_types18[[i]] ,  ".\n")
}
cat("Obteniendo asi un total de:",i," variables registradas.\n")

cat("Asi culmina el Ejercicio #1. ")
