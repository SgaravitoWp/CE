library(readr)

cat("Inicia el proceso de lectura de los datos ... \n\n")

# Inicialmente, en este apartado instanciamos los vectores correspondientes a los nombres y
# tipo de variables personalizados. 

columns_netflix_data = c("Show ID", "Tipo", "Título", "Director", "Reparto",
                         "País", "Fecha de añandida" , 
                         "Año de lanzamiento", "Rating", "Duración",
                         "Categoría", "Descripción")
types_netflix_data = cols("c", "f", "c", "c", "c", "c", col_date("%B %d, %Y"),
                          "i", "f", "c", "c"
                          ,"c")

# Posteriormente, leemos el csv desde nuestro directorio de trabajo asignándoles
# nombres y tipo de variable previamente establecidos. 

netflix_data = read_csv("netflix_titles.csv", col_names = columns_netflix_data,
                        skip = 1, col_types = types_netflix_data)

# A continuación, se imprime el nombre de cada variable y su tipo. 

column_names = colnames(netflix_data)
column_types = sapply(netflix_data,class)

for(i in 1:length(column_names)){
  cat("Variable: ", column_names[[i]], ", Tipo:", column_types[[i]], "\n")
}

# Finalmente, imprimimos el número de registros de nuestro conjunto de datos. 

cat("\n")

cat("El número de registros es de", nrow(netflix_data), ".\n")

cat("Así culmina el Ejercicio #3. ")

