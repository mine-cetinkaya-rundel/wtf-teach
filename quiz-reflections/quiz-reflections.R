# load packages ----------------------------------------------------------------

library(tidyverse)
library(readxl)
library(tidytext)
library(RColorBrewer)
library(wordcloud)

# load data -------------------------------------------------------------

oq_02 <- read_excel("quiz-reflections/data/OQ 02 - Fall 2019.xlsx")
oq_02 <- oq_02[,8]
names(oq_02) <- "reflection"


oq_05 <- read_excel("quiz-reflections/data/OQ 05 - Fall 2019.xlsx")
oq_05 <- oq_05[,8]
names(oq_05) <- "reflection"

pal <- brewer.pal(6, "Blues")

oq_05 %>%
  unnest_tokens(word, reflection) %>%
  anti_join(stop_words, by = c("word" = "word")) %>%
  filter(word != "question") %>%
  count(word, sort = TRUE) %>%
  with(wordcloud(word, n, random.order = FALSE, colors = pal))

oq_05 %>%
  unnest_tokens(ngram, reflection, token = "ngrams", n = 2) %>%
  count(ngram, sort = TRUE) %>%
  View()
  
