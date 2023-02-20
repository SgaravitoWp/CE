library(stringr)

peliculas = read.csv('movie_avshotlength.csv')
peliculas$ASL = NULL


missings <- function(x) return(sum(is.na(x)))
apply(peliculas,2,missings)

cat("El conjunto de datos tiene 110001 filas y hay 4 valores perdidos en la variable 'Year'.")
# head(peliculas, 200)

# multiDirector <- subset(peliculas,str_detect(Director,"^.*&.*&.*"),
#                   select=c(Title, Year, Director, Country))
# head(multiDirector, 200)
# bmultiDirector <- subset(peliculas,str_detect(Director,"^.*&.*"),
#                   select=c(Title, Year, Director, Country))
# cmultiDirector <- subset(peliculas,str_detect(Director,"^.*&(?!&)"),
#                   select=c(Title, Year, Director, Country))

directores = with(peliculas, str_count(Director,"&") + 1)
table(directores)
cat("10766 tienen un director.")
cat("233 tienen dos directores.")
cat("2 tienen 3 o más directores.")

numeros = subset(peliculas,str_detect(Title,"\\d"),
                         select=c(Title, Year, Director, Country))
cat("Hay 351 películas cuyos nombres tienen números: ")
numeros


punt = subset(peliculas,str_detect(Title,"[:punct:]"),
                         select=c(Title, Year, Director, Country))
cat("Hay 4141 películas cuyos nombres tienen signos de puntuación: ")
punt

peliculas = within(peliculas, {NumDirectores = str_count(Director,"&")+1})
peliculas1Director = subset(peliculas, NumDirectores == 1, select=c(Title, Year, Director, Country))
arreglarNombre = function(x) {
  nombreVector = str_split(x, ',')
  nombreString = paste(nombreVector[2],  nombreVector[1])
  return (str_squish(nombreString))
}
peliculas1DirectorConNombreCorregido = within(peliculas1Director, {
                              Title = arreglarNombre(Title)

                         })

with(peliculas, table(Director))
cat("Martin Scorsese dirigió 19 películas.")
cat("Kathryn Bigelow dirigió 6 películas.")

with(peliculas, table(Country))
cat("Hay 16 películas argentinas y 20 mexicanas")
