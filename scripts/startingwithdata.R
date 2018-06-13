library(tidyverse)

download.file("https://ndownloader.figshare.com/files/2292169",             
              "data/portal_data_joined.csv")

surveys <- read.csv("data/portal_data_joined.csv")

plot(surveys$sex)
levels(surveys$sex)

sex <- surveys$sex
levels(sex) <- c("undetermined","female","male")
sex <- factor(sex, levels=c( "female", "male","undetermined"))
plot(sex)

str(surveys)

library(lubridate)

my_date <- ymd("2015-01-01")
str(my_date)
my_date <- ymd(paste("2015","1","1", sep="-"))
str(my_date)
my_date <- ymd(paste(surveys$year,surveys$month,surveys$day, sep="-"))
str(my_date)
surveys$date <- ymd(paste(surveys$year,surveys$month,surveys$day, sep="-"))
str(surveys)
surveys$date
is.missing_date <- is.na(surveys$date)
is.missing_date
date_columns <- c("year","month","day")
missing_dates <- surveys[is.missing_date, date_columns]
head(missing_dates)

