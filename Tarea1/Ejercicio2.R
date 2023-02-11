library(readr)

cat("Inicia el proceso del ejercicio ... \n\n")
cat("Lectura de title.basics ... \n")

# Lectura de title.basics 

df_basics = read_tsv("https://datasets.imdbws.com/title.basics.tsv.gz", 
                     col_types = cols("c", "f", "c", "c", "l", "i", 
                    "i", "i", "c"), na = c("\\N", "NA"),  n_max = 5000)

# A continuación obtendremos el número de variables que posee el conjunto de
# datos.

cat("Nuestro conjunto de datos posee", ncol(df_basics), "variables. \n")

# Finalmente, procedemos a imprimir  el tipo de cada variable: "

column_names = colnames(df_basics)
column_types = sapply(df_basics, class)

for (i in 1:length(column_names)) {
  cat("Variable: ", column_names[[i]], ", Tipo: ", column_types[[i]] ,  "\n")
}

# Cabe aclarar que en el Dataset Details los tipos de las variables están 
# descritos respectivamente como: string, string, string, boolean, year(int),
# year(int), minutes(int), string más coherente. " 

cat("\n\n")

# Lectura de title.principals

cat("Lectura de title.principals ... \n")

df_principals = read_tsv("https://datasets.imdbws.com/title.principals.tsv.gz", 
                    col_types = cols_only("c", "-", "c", "c", "c", "c"),
                    na = c("\\N", "NA"),  n_max = 5000)

# A continuación obtendremos el número de variables que posee el conjunto de
# datos.

cat("Nuestro conjunto de datos posee", ncol(df_principals), "variables. \n")

# Finalmente, procedemos a imprimir  el tipo de cada variable: "

column_names = colnames(df_principals)
column_types = sapply(df_principals, class)

for (i in 1:length(column_names)) {
  cat("Variable: ", column_names[[i]], ", Tipo: ", column_types[[i]] ,  "\n")
}

cat("\n\n")

# Lectura de name.basics

cat("Lectura de name.basics ... \n")

df_names = read_tsv("https://datasets.imdbws.com/name.basics.tsv.gz", 
                     col_types = cols_only("c", "c", "i", "i", "c", "-"),
                    na = c("\\N", "NA"),  n_max = 5000)

# A continuación obtendremos el número de variables que posee el conjunto de
# datos.

cat("Nuestro conjunto de datos posee", ncol(df_names), "variables. \n")

# Finalmente, procedemos a imprimir  el tipo de cada variable: "

column_names = colnames(df_names)
column_types = sapply(df_names, class)

for (i in 1:length(column_names)) {
  cat("Variable: ", column_names[[i]], ", Tipo: ", column_types[[i]] ,  "\n")
}

# Al igual que en title.basics, asignamos el valor más coherente a las variables
# correspondientes a años como integer. 

cat("\n\n")

cat("Así culmina nuestro Ejercicio #2.")