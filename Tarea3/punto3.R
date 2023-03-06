library(dplyr)
library(readxl)
library(sqldf)
library(stringr)

season1415 = read_excel("season-1415.xlsx")
season1516 = read_excel("season-1516.xlsx")
season1617 = read_excel("season-1617.xlsx")
season1718 = read_excel("season-1718.xlsx")
season1819 = read_excel("season-1819.xlsx")


## La siguiente función permite obtener la tabla de cualquier temporada
tablaTemporada = function(temporada) {
  partidosPorCadaEquipo = sqldf(paste("SELECT HomeTeam AS Team, FTHG as GF, FTAG as GA, HS as S, HST as ST, HR as R
                                 FROM", temporada, 
                                 "UNION ALL
                                 SELECT AwayTeam AS Team, FTAG as GF, FTHG as GA, 'AS' as S, AST as ST, AR as R
                                 FROM
                                 ", temporada))

  tablaFinal = sqldf ("SELECT Team, COUNT(*) as Played, 
                      SUM(CASE WHEN GF > GA THEN 1 ELSE 0 END) AS Won,
                      SUM(CASE WHEN GF = GA THEN 1 ELSE 0 END) AS Drawn,
                      SUM(CASE WHEN GF < GA THEN 1 ELSE 0 END) AS Lost,
                      SUM(GF) as GF, SUM(GA) as GA, SUM(GF)-SUM(GA) AS GD,
                      SUM(ST)/SUM(S) AS STPercent,
                      SUM(CASE WHEN R > 0 THEN 1 ELSE 0 END) AS MatchesR
                      FROM partidosPorCadaEquipo
                      GROUP BY Team
                      ORDER BY Won desc
                      ")

  tablaFinal = sqldf("SELECT Team, Played, Won, Drawn, Lost, CAST(Won AS float) / CAST(Played AS float) AS WonPercent,
                     GF, GA, GD, STPercent, 
                     CAST(MatchesR AS float) / CAST(Played AS float) as RedCardPercent, (Won * 3 + Drawn) AS Points
                     FROM tablaFinal
                     ORDER BY Points DESC, GD DESC
                     ")
  tablaFinal = sqldf("SELECT *, ROW_NUMBER() OVER (ORDER BY Points DESC) AS Pos
                     From tablaFinal")
  return (tablaFinal)
}

tablaTemporadaDplyr = function(temporada) {
  partidosPorCadaEquipo = temporada %>%
    select(Team = HomeTeam, GF = FTHG, GA = FTAG, S = HS, ST = HST, R = HR) %>%
    bind_rows(temporada %>% 
    select(Team = AwayTeam, GF = FTAG, GA = FTHG, S = AS, ST = AST, R = AR))

  tablaFinal = partidosPorCadaEquipo %>%
               group_by(Team) %>%
               summarise(Played = n(),
               Won = sum(GF > GA),
               Drawn = sum(GF == GA),
               Lost = sum(GF < GA),
               GF = sum(GF),
               GA = sum(GA),
               GD = sum(GF) - sum(GA),
               STPercent = sum(ST)/sum(S),
               MatchesR = sum(R>0)) %>%
               mutate(
               RedCardPercent = MatchesR / Played,
               WonPercent = Won / Played,
               Points = (Won * 3 + Drawn)) %>%
               arrange(desc(Points), desc(GD)) %>%
               mutate(Pos = row_number()) %>%
               as.data.frame()
  tablaFinal$MatchesR = NULL
  return (tablaFinal)
}

##SQL
startTimeSql = Sys.time()

tabla1415 = tablaTemporada('season1415')
head(tabla1415)

tabla1516 = tablaTemporada('season1516')
head(tabla1516)

tabla1617 = tablaTemporada('season1617')
head(tabla1617)

tabla1718 = tablaTemporada('season1718')
head(tabla1718)

tabla1819 = tablaTemporada('season1819')
head(tabla1819)

endTimeSql = Sys.time()
timeSql = endTimeSql - startTimeSql

timeSql


##DPLYR

startTimeDplyr = Sys.time()

tabla1415dplyr = tablaTemporadaDplyr(season1415)
head(tabla1415dplyr)

tabla1516dplyr = tablaTemporadaDplyr(season1516)
head(tabla1516dplyr)

tabla1617dplyr = tablaTemporadaDplyr(season1617)
head(tabla1617dplyr)

tabla1718dplyr = tablaTemporadaDplyr(season1718)
head(tabla1718dplyr)

tabla1819dplyr = tablaTemporadaDplyr(season1819)
head(tabla1819dplyr)

endTimeDplyr = Sys.time()
timeDplyr = endTimeDplyr - startTimeDplyr
timeDplyr

## Cuales equipos se mantuvieron en las primeras 4 posiciones de la clasificación final?
topn = function(n) {
top = sqldf(paste("SELECT Team, Pos FROM tabla1415 WHERE Pos <=", n,
             "UNION ALL SELECT Team, Pos FROM tabla1516 WHERE Pos <=", n,
             "UNION ALL SELECT Team, Pos FROM tabla1617 WHERE Pos <=", n,
             "UNION ALL SELECT Team, Pos FROM tabla1718 WHERE Pos <=", n,
             "UNION ALL SELECT Team, Pos FROM tabla1819 WHERE Pos <=", n
             ))
top = sqldf("SELECT Team, COUNT(*) as VecesEnElTop
             FROM top
             GROUP BY Team
             ORDER BY VecesEnElTop DESC")

return (top)
}

#Estas tablas nos muestran todos los equipos que estuvieron en el top n en las 5 temporadas y las veces que estuvieron en el top.
#Para este ejercicio solo nos interesan aquellos que estuvieron 5 veces en el top en las 5 temporadas.
top4 = topn(4)
top4

top5 = topn(5)
top5

top6 = topn(6)
top6

#De manera similar, esta función crea una tabla con los equipos que estuvieron abajo en la puntuación
bottomn = function(n) {
bottom = sqldf(paste("SELECT Team, Pos FROM tabla1415 WHERE Pos >", 20-n,
             "UNION ALL SELECT Team, Pos FROM tabla1516 WHERE Pos >", 20-n,
             "UNION ALL SELECT Team, Pos FROM tabla1617 WHERE Pos >", 20-n,
             "UNION ALL SELECT Team, Pos FROM tabla1718 WHERE Pos >", 20-n,
             "UNION ALL SELECT Team, Pos FROM tabla1819 WHERE Pos >", 20-n
             ))
bottom = sqldf("SELECT Team, COUNT(*) as VecesQueDescendieron
             FROM bottom
             GROUP BY Team
             ORDER BY VecesQueDescendieron DESC")
return(bottom)
}

bottom3 = bottomn(3)
bottom3
