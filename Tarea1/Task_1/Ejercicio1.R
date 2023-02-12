

#CHICOS, ME FALTA COMENTARLE Y EXPLICAR UNAS COSAS, PERO NO SE SI ESTA FORMA SEA LA CORRECTA, O SI DEBO AGREGARLE 
#ALGO PARA QUE TAMBIEN ME DIGA EL TOTAL DE DATOS QUE HAY.
#TAMBIEN ESTABA PENSANDO EN COMO HACER PARA REDUCIR MUCHAS LINEAS.


#░░░░░░░░░░░░░░░░░░░░░░█████████
#░░███████░░░░░░░░░░███▒▒▒▒▒▒▒▒███
#░░█▒▒▒▒▒▒█░░░░░░░███▒▒▒▒▒▒▒▒▒▒▒▒▒███
#░░░█▒▒▒▒▒▒█░░░░██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
#░░░░█▒▒▒▒▒█░░░██▒▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒▒███
#░░░░░█▒▒▒█░░░█▒▒▒▒▒▒████▒▒▒▒████▒▒▒▒▒▒██
#░░░█████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
#░░░█▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒██
#░██▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒██▒▒▒▒▒▒▒▒▒▒██▒▒▒▒██
#██▒▒▒███████████▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒▒██
#█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒████████▒▒▒▒▒▒▒██
#██▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
#░█▒▒▒███████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
#░██▒▒▒▒▒▒▒▒▒▒████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█
#░░████████████░░░█████████████████






#Lo primero es identificar la extencion de los archivos que trabajaremos.
#Al percatarnos que son .xlsx, usaremos la libreria:

library(readxl)

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

for (i in 1:length(column_names)) {
  cat("La variable: ", column_names[[i]], ", es de tipo: ", column_types[[i]] ,  ".\n")
}
cat("Obteniendo asi un total de:",i," variables registradas.")


#Season1516

column_names15 = colnames(season1516)
column_types15 = sapply(season1516, class)

for (i in 1:length(column_names)) {
  cat("La variable: ", column_names[[i]], ", es de tipo: ", column_types[[i]] ,  ".\n")
}
cat("Obteniendo asi un total de:",i," variables registradas.")



#Season1617

column_names16 = colnames(season1617)
column_types16 = sapply(season1617, class)

for (i in 1:length(column_names)) {
  cat("La variable: ", column_names[[i]], ", es de tipo: ", column_types[[i]] ,  ".\n")
}
cat("Obteniendo asi un total de:",i," variables registradas.")



#Season1718

column_names17 = colnames(season1718)
column_types17 = sapply(season1718, class)

for (i in 1:length(column_names)) {
  cat("La variable: ", column_names[[i]], ", es de tipo: ", column_types[[i]] ,  ".\n")
}
cat("Obteniendo asi un total de:",i," variables registradas.")



#Season1819

column_names18 = colnames(season1819)
column_types18 = sapply(season1819, class)

for (i in 1:length(column_names)) {
  cat("La variable: ", column_names[[i]], ", es de tipo: ", column_types[[i]] ,  ".\n")
}
cat("Obteniendo asi un total de:",i," variables registradas.")
  