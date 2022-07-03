games_sales <- read.csv("C:\\Users\\Akira\\Desktop\\LSE\\R\\game_data\\games_sales.csv", header = TRUE)

#import necessary libraries
library(tidyverse)
library(stringr)
library(dplyr)
library(DataExplorer)
library(ggplot2)

#view the data
dim(games_sales)
view(games_sales)
summary(games_sales)
tibble(games_sales)
head(games_sales)
tail(games_sales)
str(games_sales)
glimpse(games_sales)
colnames(games_sales)
DataExplorer::create_report(games_sales)

#Check for missing values
games_sales[is.na(games_sales)]

#Console below shows no rows with missing values

#Convert values under genre to lowercase
games_sales$Genre <- str_to_lower(games_sales$Genre)
head(games_sales)

#merge columns
games_sales$combined <- str_c(games_sales$Publisher,' ', games_sales$Genre)
head(games_sales$combined)

head(games_sales)

#VISUALISING TRENDS ACROSS GAMES_SALES DATA
qplot(Platform, Publisher, fill = Year, data = games_sales, geom = 'raster') #table is illegible

qplot(Publisher, data = games_sales, geom = 'bar')
#To see the variation of sales across genre
qplot(Publisher, fill = Genre, data = games_sales, geom = 'bar')

#Shows the sales split into Genre
qplot(Genre, data = games_sales, geom = 'bar', main = 'Game Sales Per Genre')

#Shows sales of game genres across each release year
qplot(Year, fill = Genre, data = games_sales, geom = 'bar')
qplot(Genre, fill = Year, data = games_sales, geom = 'bar')

#Aggregate sales for each location over video game genre - Action games were found to sell the most units across locations
aggregate(games_sales$EU_Sales, list(games_sales$Genre), FUN=sum) 
aggregate(games_sales$NA_Sales, list(games_sales$Genre), FUN=sum) 
aggregate(games_sales$Global_Sales, list(games_sales$Genre), FUN=sum) 

#Aggregate sales for release year
aggregate(games_sales$NA_Sales, list(games_sales$Year), FUN=sum) # Games released in 2009 were the most lucrative for NA Sales
aggregate(games_sales$EU_Sales, list(games_sales$Year), FUN=sum) # Games released in 2008 were the most lucrative for EU Sales
aggregate(games_sales$Global_Sales, list(games_sales$Year), FUN=sum) # Games released in 2009 were the most lucrative for Global Sales

#import library for skewness
library(moments)
#EU Games sales skewness
skewness(games_sales$EU_Sales)  #right skewness
kurtosis(games_sales$EU_Sales)

#NA Games sales skewness
skewness(games_sales$NA_Sales) #also right skewness
kurtosis(games_sales$NA_Sales)
  
#some boxplots - shows outliers
boxplot(games_sales$EU_Sales)
boxplot(games_sales$NA_Sales)
boxplot(games_sales$Global_Sales)

qplot(EU_Sales, data = games_sales)

#Scatter plots
qplot(EU_Sales, Year, data = games_sales)
qplot(NA_Sales, Year, data = games_sales)
qplot(Global_Sales, Year, data = games_sales)
#These scatterplots show the sales global sales in the previous financial year (millions)


