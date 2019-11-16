# load packages ----------------------------------------------------------------

library(readxl)
library(tidyverse)

# load data --------------------------------------------------------------------

d <- read_excel("latin-R/index-cards/IDS, Fall 2019_Getting to know you(1-100).xlsx") 

# rename columns ---------------------------------------------------------------

col_names <- c("survey_id", "start_time", "completion_time", "recorded_email", "recorded_name", 
               # individual
               "student_id", "name", "preferred_name", "pronunciation", 
               "pronouns", "github", "cool_unique", "anything_else",
               # overall
               "learn_best", "fav_class", "programming_before", "stats_before", 
               "fav_songs", "learning_goals", "concerns", "clarification", 
               "read_slides", "hear_class")

names(d) <- col_names

# subset data ------------------------------------------------------------------

d <- d %>% select(-c(1:5))

# plots ------------------------------------------------------------------------

d <- d %>%
  mutate(
    read_slides = fct_other(read_slides, keep = c("Yes", "No")),
    read_slides = fct_relevel(read_slides, "Yes", "No", "Other")
    )

ggplot(d, aes(x = read_slides, fill = read_slides)) +
  geom_bar() +
  coord_flip() +
  scale_fill_viridis_d() +
  guides(fill = "none") +
  labs(x = "", 
       title = "Read the slides easily during the first lecture") +
  ylim(0, 85)
ggsave(filename = "latin-R/index-cards/read-slides.png", width = 7, height = 3)


d <- d %>%
  mutate(hear_class = fct_other(hear_class, 
                                keep = c("Yes", "No, heard the professor but not the questions / answers from students who participated")))

levels(d$hear_class)[1] = "Heard prof,\nbut not student questions"

d <- d %>%
  mutate(hear_class = fct_relevel(hear_class, "Yes", "Heard prof,\nbut not student questions", "Other"))

ggplot(d, aes(x = hear_class, fill = hear_class)) +
  geom_bar() +
  coord_flip() +
  scale_fill_viridis_d() +
  guides(fill = "none") +
  labs(x = "", 
       title = "Hear well during the first lecture") +
  ylim(0, 85)
ggsave(filename = "latin-R/index-cards/hear-class.png", width = 7, height = 3)



