rm(list=ls())
install.packages("Hmisc")
library(Hmisc)
data1 = read.csv("C:\\Users\\PC\\Downloads\\COVID19_line_list_data.csv")
describe(data1)
#cleaned up death column
data1$death_dummy = as.integer(data1$death != 0)
unique(data1$death_dummy)
# death rate
sum(data1$death_dummy) / nrow(data1)

#Age
#claim : gender has no effect
men = subset(data1, gender == "male")
women = subset(data1, gender == "female")
mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)
t.test(men$death_dummy, women$death_dummy, alternative = "two.sided",conf.level = 0.95)
#95% confidence: men have from 0.8% to 8.8% higher chances of dying
#p-value = 0.002 < 0.05, so this is statistically significant.