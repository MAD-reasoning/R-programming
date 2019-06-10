# SVR
setwd("C:/Users/Lenovo")

# Import libraries
library(caTools)

# Load dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]
#View(dataset)

# Fitting SVR
#install.packages('e1071')
library(e1071)
model = svm(formula = Salary ~ .,
           data = dataset,
           type = 'eps-regression')
summary(model)

# Predicting results
y_pred = predict(model, data.frame(Level = 6.5))
y_pred

# Visualising Linear Regression
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = dataset$Level, y = predict(model, newdata = dataset)),
            colour = 'blue')+
  ggtitle('Salary VS Level (SVR)')+
  xlab('Levels')+
  ylab('Salary')