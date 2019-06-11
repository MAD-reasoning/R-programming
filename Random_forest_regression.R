# Random Forest
setwd("C:/Users/Lenovo")

# Import libraries
library(caTools)

# Load dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]
#View(dataset)

# Fitting Random Forest
# install.packages('randomForest')
library(randomForest)
set.seed(1234)
model = randomForest(x = dataset[1],
                     y = dataset$Salary,
                     ntree = 500)
summary(model)

# Predicting results
y_pred = predict(model, data.frame(Level = 6.5))
y_pred

# Visualising Random Forest
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.001)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = x_grid, y = predict(model, newdata = data.frame(Level = x_grid))),
            colour = 'blue')+
  ggtitle('Salary VS Level (Random Forest)')+
  xlab('Levels')+
  ylab('Salary')