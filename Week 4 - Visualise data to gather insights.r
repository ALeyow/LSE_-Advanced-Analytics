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

#Check for missing values
lego[is.na(lego)]


##VISUALISE THE DATA TO UNDERSTAND THE TRENDS ACROSS VARIABLES
#Number of reviews by age & play star difficulty
qplot(ages, num_reviews, data = lego, main = "Number of Reviews by Age") + geom_point(data = lego, aes(x = ages, y = num_reviews, color = play_star_rating))
#Above table shows the count of reviews made by each age NOT the sum

#Chart the table above with play_star_rating labels for comparison
qplot(ages, num_reviews, data = lego) + geom_point(data = lego, aes(x = ages, y = num_reviews, color = play_star_rating)) + geom_text(aes(label = play_star_rating), nudge_y = 10)


#Count of Ages 
qplot(ages, data = lego, geom = "bar", main = "Age Count")


#Count of Reviews by Age Group
ggplot(lego, aes(x=ages, y=num_reviews)) +  geom_bar(stat = "identity") + ggtitle("Review Count by Age")

#Same plot as above but with labels for reference
ggplot(lego, aes(x=ages, y=num_reviews)) +  geom_bar(stat = "identity") + ggtitle("Review Count by Age") + geom_text(aes(label = num_reviews))

#The barplot was able to determine that age group 8 provided the highest number of reviews of lego set with a total of 53379 reviews, though this was unreadable on the same plot when adding labels. However it can be clearly seen from looking at the bar chart. 



#Create a new dataframe using data_age25 <- data[data$age>=25,]
data_age25 <- lego[lego$age>=25,]
data_age25

#Create a chart to determine highest price

#Scatterplot 
qplot(x = ages, y = list_price, data = data_age25) + ggtitle("Lego Purchase Prices for Age 25 and Above") + aes(x = ages, y = list_price, color = list_price)

#Scatterplot with labels 
qplot(x = ages, y = list_price, data = data_age25) + ggtitle("Lego Purchase Prices") + geom_text(aes(label = list_price))+ aes(x = ages, y = list_price, color = list_price)

#The scatterplot was the best chart to use for comparing purchases by ages 25 and above. Adding labels to the chart made the data unreadable due to data size but was able to determine that the highest price paid by 25 and above was $259.87


