# SIMPLE LINEAR REGRESSION
setwd("C:/Users/Lenovo")

# Import libraries
library(caTools)

# Load dataset
dataset = read.csv('Salary_Data.csv')
#View(dataset)

# Splitting data
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting simple linear regression
model = lm(formula = Salary ~ YearsExperience,
           data = training_set)
summary(model)

# Predicting results
y_pred = predict(model, newdata = test_set)
y_pred

# Visualising training set
library(ggplot2)
ggplot()+
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red')+
  geom_line(aes(x = training_set$YearsExperience, y = predict(model, newdata = training_set)),
            colour = 'blue')+
  ggtitle('Salary VS Experience (Training Set)')+
  xlab('Years of Experience')+
  ylab('Salary')

# Visualising test set
library(ggplot2)
ggplot()+
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red')+
  geom_line(aes(x = training_set$YearsExperience, y = predict(model, newdata = training_set)),
            colour = 'blue')+
  ggtitle('Salary VS Experience (Test Set)')+
  xlab('Years of Experience')+
  ylab('Salary')