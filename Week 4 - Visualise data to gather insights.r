lego <- read.csv(file = "C:\\Users\\Akira\\Desktop\\LSE\\R\\game_data\\lego.csv",
                 header = TRUE)
library(tidyverse)
library(ggplot2)

#Sense check the data
view(lego)
str(lego)
typeof(lego)
dim(lego)
class(lego)
summary(lego)

#Number of reviews by age & play star difficulty
qplot(ages, num_reviews, data=lego) + geom_point(data = lego, aes(x = ages, y = num_reviews, color = play_star_rating))

qplot(ages, num_reviews, data = lego) + geom_point(data = lego, aes(x = ages, y = num_reviews, color = play_star_rating)) + geom_text(aes(label = play_star_rating), nudge_y = 10)

qplot(ages, num_reviews, data = lego, main = "Number of Reviews by Age") + geom_point(data = lego, aes(x = ages, y = num_reviews, color = play_star_rating))

#Count of Ages 
qplot(ages, data = lego, geom = "bar", main = "Age Count")

#Review Difficulty 
qplot(ages, num_reviews, data = lego) + geom_point(data = lego, aes(x = ages, y = num_reviews, color = review_difficulty)) + geom_text(aes(label = review_difficulty))

#Count of Reviews by Age Group
ggplot(lego, aes(x=ages, y=num_reviews)) +  geom_bar(stat = "identity") + ggtitle("Review Count by Age") + geom_text(aes(label = num_reviews))


#Create a new dataframe using data_age25 <- data[data$age>=25,]
data_age25 <- lego[lego$age>=25,]
data_age25

#Create a chart to determine highest price
qplot(list_price, data=data_age25, geom="bar")

#Scatterplot 
qplot(y = list_price, data = data_age25) + ggtitle("Lego Purchase Prices")

#Histogram - 
qplot(list_price, data = data_age25)

#Boxplot
qplot(list_price, ages, data = data_age25, geom = "boxplot")
