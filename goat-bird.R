nz_bird <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-11-19/nz_bird.csv")
library(tidyr)
library(ggplot2)
library(tidyverse)

# shows how many votes in each category
a<-table(nz_bird$vote_rank)
a

# shows how many votes per hour
a<-table(nz_bird$hour)
a

# shows how many votes per hour in a bar graph
ggplot(nz_bird, aes(hour)) + geom_bar()