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

# Count of all votes of birds
ggplot(nz_bird, aes(bird_breed)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Count of Westland Petrel votes per hour
nz_bird %>% filter(nz_bird$bird_breed=="Westland Petrel") %>% ggplot(nz_bird, mapping= aes(hour)) + geom_bar()

# Testing with Westland Petrel votes per hour
test <- filter(nz_bird, bird_breed=="Westland Petrel")
attach(test)
test[order(hour),]



# Add in means, median, mode

# Mean of hours in histogram
ggplot(nz_bird, aes(hour)) + geom_histogram(color="black", fill="white", binwidth = 1) + geom_vline(aes(xintercept=mean(hour)),color="blue", linetype="dashed", size=1)

# Median of hours in histogram
ggplot(nz_bird, aes(hour)) + geom_histogram(color="black", fill="white", binwidth = 1) + geom_vline(aes(xintercept=median(hour)),color="blue", linetype="dashed", size=1)

# Mode of hours in histogram
# had to make a function for mode first!
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

ggplot(nz_bird, aes(hour)) + geom_histogram(color="black", fill="white", binwidth = 1) + geom_vline(aes(xintercept=getmode(nz_bird$hour)),color="blue", linetype="dashed", size=1)


