#Step-1 Data Preprocessing

dataset = read.csv('Salary_Data.csv')

library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Step-2 Fitting simple Linear Regression to the training dataset

regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

#Step-3 Predict Test set

y_pred = predict(regressor, newdata = test_set)

#Step-4 
# A) Visualizing training Set Results
install.packages('ggplot2')
library(ggplot2)

ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary)
             , color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set))
            , color = 'blue') +
  ggtitle('Salary vs Years of Experience(Training set)') + 
  xlab('Years of Experience') +
  ylab('Salary')
# B) Visualizing Test Set Results
library(ggplot2)

ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary)
             , color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set))
            , color = 'blue') +
  ggtitle('Salary vs Years of Experience(Test set)') + 
  xlab('Years of Experience') +
  ylab('Salary')

