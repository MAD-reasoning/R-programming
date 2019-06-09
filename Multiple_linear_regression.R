# Multiple Linear Regression
setwd("C:/Users/Lenovo")

# Import libraries
library(caTools)

# Load dataset
dataset = read.csv('A50_Startups.csv')
#View(dataset)

# Categorical data
dataset$State = factor(dataset$State, 
                         levels = c('New York', 'California', 'Florida'), 
                         labels = c(1, 2, 3))

# Splitting data
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting simple linear regression
model = lm(formula = Profit ~ .,
           data = training_set)
# same as model = lm(formula = Profit ~ R.D.Spend + Adminstration + Marketing.Spend + State,data = training_set)

summary(model)

# Predicting results
y_pred = predict(model, newdata = test_set)
y_pred
