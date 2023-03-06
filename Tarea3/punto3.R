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

##DPLYR
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
