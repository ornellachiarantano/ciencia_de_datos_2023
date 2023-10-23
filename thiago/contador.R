# Instala y carga la biblioteca necesaria (si no lo has hecho antes)
##install.packages("tm")
##install.packages("matrixStats")  # Agregar esta línea para corregir el error
library(matrixStats)  # Agregar esta línea para cargar matrixStats
library(tm)
library(tidyverse)
library(tidytext)
library(ggwordcloud)
library(stopwords)
library(topicmodels)
library(ldatuning)
library(syuzhet)

# Cargar el archivo .rds
my_data <- readRDS("data/scraping-clarin-2023-10-09.rds")


my_data %>% 
  filter(stringr::str_detect(content,"narcotráfico")) -> narcotrafico

my_data %>% 
  filter(stringr::str_detect(content,"narco")) -> narco

my_data %>% 
  filter(stringr::str_detect(content,"droga")) -> droga


data <- bind_rows(narcotrafico, narco, droga)

# Accede a la tercera columna "content"
textos <- data$content

# Crear un corpus de texto
corpus <- Corpus(VectorSource(textos))

# Preprocesamiento del texto
corpus <- tm_map(corpus, content_transformer(tolower))  # Convierte a minúsculas
corpus <- tm_map(corpus, removePunctuation)            # Elimina puntuación
corpus <- tm_map(corpus, removeNumbers)               # Elimina números

# Cargar una lista de stopwords en español (o el idioma de tu texto)
stopwords <- stopwords("spanish")

# Eliminar stopwords
corpus <- tm_map(corpus, removeWords, stopwords)


# Crear una matriz de términos (Document-Term Matrix)
dtm <- DocumentTermMatrix(corpus)

# Lista de stopwords personalizadas que deseas eliminar del conteo
stopwords_personalizadas <- c("“", "dos", "años", "dijo", "ser","hace","después","foto")

# Eliminar stopwords personalizadas
dtm <- dtm[, !(colnames(dtm) %in% stopwords_personalizadas)]

# Calcular la suma de frecuencias de cada palabra en todo el corpus
word_freq <- colSums(as.matrix(dtm))

# Ordenar las palabras por frecuencia en orden descendente
word_freq <- sort(word_freq, decreasing = TRUE)

# Mostrar las palabras más frecuentes y sus frecuencias
head(word_freq, 10)


