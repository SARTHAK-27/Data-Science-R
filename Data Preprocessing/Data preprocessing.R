#Data Preprocessing in R

# 1. Import the Dataset

dataset = read.csv('Data.csv')

# 2 Taking care of missing data 

dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)

# 3 Encoding Categorical data

dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1,2,3))

dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0,1))

# 4 Split the dataset into Training set and Test set
#install.packages('caTools')

library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_dataset = subset(dataset, split == TRUE)
test_dataset = subset(dataset, split == FALSE)

# 5 Feature Scaling
training_dataset[ , 2:3] =  scale(training_dataset[ , 2:3])
test_dataset[ , 2:3] = scale(test_dataset[, 2:3])
