games_sales <- read.csv("C:\\Users\\Akira\\Desktop\\LSE\\R\\game_data\\games_sales.csv", header = TRUE)

library(tidyverse)


summary(games_sales)
view(games_sales)
str(games_sales)

sales_only <- games_sales[,c(7,8,9)]
head(sales_only)
cor(sales_only)

model1 = lm(Global_Sales ~ EU_Sales, data = sales_only)
summary(model1)

SSE1 = sum(model1$residuals^2)
SSE1

model2 = lm(Global_Sales ~ NA_SAles, data = sales_only)
summary(model2)

SSE2 = sum(model2$residuals^2)
SSE2

model3 = lm(Global_Sales ~ EU_Sales + NA_Sales, data = sales_only)
summary(model3)

SSE3 = sum(model3$residuals^2)
SSE3

#model3 has the best set of least squares. Use model3 for Global_Sales multiple regression

predictTest = predict(model3, data = games_sales, interval = 'confidence')
predictTest


summary(predictTest)
 

write.table(x = predictTest, file = "C:\\Users\\Akira\\Desktop\\LSE\\R\\game_data\\predictTest.csv")

#Based on the multiple regression for global sales in the next financial year, Turtle Games should expect to sell a total of approximately 9012 million units of video games


