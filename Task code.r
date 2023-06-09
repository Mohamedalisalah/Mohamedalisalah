#Load the data :
data <- read.csv("G4_howell.csv")
#Remove missing from weight column and remove overweight column :
df$weight <- gsub(' kg', '', df$weight)
df$Overweight <- NULL
#Convert sex to factor and weight to numeric :
df$sex <- as.factor(df$sex)
df$weight <- as.numeric(df$weight) 
print(summary(df))
#Imputation :
library(mice)
imputation <- mice(df, m = 5, meth = c('', '', 'pmm', ''), maxit = 10)
new_df <- complete(imputation, 5)
#Save the data :
write.csv(new_df, file = 'G4_howell_mod.csv')
#visualization :
library(ggplot2)
ggplot(new_df, aes(age)) + geom_histogram()
ggplot(new_df, aes(weight)) + geom_histogram()
ggplot(new_df, aes(height)) + geom_histogram()
