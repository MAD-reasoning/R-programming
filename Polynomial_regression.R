# Polynomial REGRESSION
setwd("C:/Users/Lenovo")

# Import libraries
library(caTools)

# Load dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]
#View(dataset)


# Fitting simple linear regression
model_l = lm(formula = Salary ~ .,
           data = dataset)
summary(model_l)

# Fitting polynomial regression
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
model_p = lm(formula = Salary ~ .,
           data = dataset)
summary(model_p)

# Visualising Linear Regression
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = dataset$Level, y = predict(model_l, newdata = dataset)),
            colour = 'blue')+
  ggtitle('Salary VS Level (Linear Regression)')+
  xlab('Levels')+
  ylab('Salary')

# Visualising Polynomial Regression
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = dataset$Level, y = predict(model_p, newdata = dataset)),
            colour = 'blue')+
  ggtitle('Salary VS Level (Polynomial Regression)')+
  xlab('Levels')+
  ylab('Salary')

# Predicting using linear model
y_pred_l = predict(model_l, newdata = data.frame(Level = 6.5))
y_pred_l

# Predicting using polynomial model
y_pred_p = predict(model_p, newdata = data.frame(Level = 6.5, Level2 = 6.5^2, Level3 = 6.5^3, Level4 = 6.5^4))
y_pred_p