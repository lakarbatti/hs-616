# Data Simulation Project
#
# Title : Aerobic fitness, micronutrient status, and academic achievement in Indian school-aged children.
#
# Authors :Desai IK1, Kurpad AV2, Chomitz VR3, Thomas T4.
#
# Reference Links : http://www.ncbi.nlm.nih.gov/pubmed/25806824
#                   http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=8&ved=0CDUQFjAH&url=http%3A%2F%2Fwww.researchgate.net%2Fprofile%2FBrent_Faught%2Fpublication%2F45628967_Comparison_of_VO2_maximum_obtained_from_20_m_shuttle_run_and_cycle_ergometer_in_children_with_and_without_developmental_coordination_disorder%2Flinks%2F0c96052b493ed29929000000.pdf&ei=_kwXVerxO5ewogSxkIKwBg&usg=AFQjCNFMgYm7RgPGNczjuMn46V1X6tNn0Q&sig2=QRtJ9k83kZeaginh_RKWjA
#                   http://www.indiachildren.com/htwtc.htm
#                   http://www.aarogya.com/family-health/childrens-health/4370-average-height-a-weight-chart-for-boys.html
#                   http://www.unt.edu/rss/class/mike/5700/Code/R.html
#                   http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0122487
#
# The story:
# Abstract
# This assignment is based on the paper provided in the above links. The scenario has been altered slightly to suit the needs
# of this assignment, without altering the final analysis. For e.g. Kannada has been replaced with English in the score calculation
# 
# Aerobic fitness has been shown to have several beneficial effects on child health. However, research on its 
# relationship with academic performance has been limited, particularly in developing countries and among 
# undernourished populations. This study in question examined the association between aerobic fitness and academic achievement 
# in clinically healthy but nutritionally compromised Indian school-aged children and assessed whether 
# micronutrient status affects this association. 273 participants, aged 7 to 10.5 years, were enrolled from 
# three primary schools in Bangalore, India. Data on participants' aerobic fitness (20-m shuttle test), 
# demographics, diet, BMI and micronutrient status were abstracted. School-wide 
# exam scores in Mathematics and English language were collected and served as indicators of academic performance and were 
# standardized by grade level. Significant positive correlations between aerobic capacity (VO2 peak)
# and academic scores in Math and English were observed (P < 0.05). 
# After standardizing scores across grade levels and adjusting for school, gender, 
# socioeconomic status, and weight status (BMI), children with greater aerobic 
# capacities demonstrated that they had greater odds of scoring above average on Math and 
# English exams. This association remained significant after adjusting for micronutrient deficiencies. These findings 
# provide preliminary evidence of a fitness to academic achievement association in Indian children. While the mechanisms by which 
# aerobic fitness may be linked to academic achievement require further investigation, the results suggest that educators and 
# policymakers should consider that children be given adequate opportunities for physical activity and fitness in schools for 
# both their physical and potential academic benefits. 
#

generateData <- function(N=5000){
  
  # The formulae for this function is taken from NCBI website  
  aerobicCapVO2Max <- function (maxSpeed, age){
    return(31.025 + 3.238 * maxSpeed - 3.248 * age + 0.1536 * (maxSpeed * age))
  }
  
  logistic <- function(t) 1 / (1 + exp(-t))
  
  BMI <- function(height, weight) weight/height^2

  ######### Statistical Data #####################
  heightMean <- c(F = 131.3, M = 130.85)
  heightSD <- c(F = 7.8, M = 6.7)
  weightMean <- c(F = 27.75, M = 27.98)
  weightSD <- c(F = 4.5, M = 3.5)
  weight <- rnorm(N,mean = weightMean, sd= weightSD)
  height <- rnorm(N,mean = heightMean, sd= heightSD)
  bmi <- BMI(height,weight)
  age <- runif(N,7,10.5)
  speed <- rnorm(N,mean=9,sd=2)  
  grade <- cut(age,breaks = 7:11,labels = 2:5,right =FALSE)
  aerobicCap <- aerobicCapVO2Max(speed,age) 

  gender <- sample(c("M", "F"), N, replace=TRUE, prob = c(0.498,0.502))
  school <- sample(c("School1", "School2", "School3"), N, replace=TRUE)
  socioEconomicStatus <- sample(c("Low", "Medium", "High"), N, replace=TRUE)

  ########### Micronutrients data ###############
  proteinIntake <- runif(N,21.1,32.7)
  fatIntake <- runif(N,14.7,27.9)
  carbIntake <- runif(N,135,204)
  
  # Converting to calories
  energyIntake <- proteinIntake *4 + fatIntake *9 + carbIntake * 4
  ############################################### 
  
  df<- data.frame(age,speed,energyIntake,proteinIntake,fatIntake,carbIntake,gender,school,weight,height,bmi,socioEconomicStatus,
             aerobicCap)
  
  df <- transform(df, score = 0.01 * (aerobicCap - mean(aerobicCap)) + 0.04 * (energyIntake - mean(energyIntake))+ 
                    66 * (bmi - mean(bmi)) - 2.1)
  df$prob <- logistic(df$score)
  hist(df$prob, breaks=50)
  
  # The outcome is then masked into a range of outcome for high and low scores for two subjects
  df$scoreMath <- round(ifelse(df$prob > runif(N), rnorm(N,mean = 94, sd= 4),rnorm(N,mean = 45, sd= 3)),2)
  df$scoreEnglish <- round(ifelse(df$prob > runif(N), rnorm(N,mean = 85, sd= 4),rnorm(N,mean = 40, sd= 3)),2)
  df$mathCategory <- factor(ifelse (df$scoreMath > 70, "High", "Low"),levels=c("Low", "High"))
  df$engCategory <- factor(ifelse (df$scoreEnglish > 65, "High", "Low"),levels=c("Low", "High"))
  return(df)
  
}
set.seed(0)
N <- 10000
df <- generateData(10000)

#View(df1)


fit1 <- glm(mathCategory ~ I(aerobicCap - mean(aerobicCap)) + I(energyIntake - mean(energyIntake)) + I(bmi - mean(bmi)), data=df, family="binomial")
coef(fit1)
summary(fit1)
## To check out linear regression outcome on this data
fit2 <- lm(scoreMath ~ I(aerobicCap - mean(aerobicCap)) + I(energyIntake - mean(energyIntake)) + I(bmi - mean(bmi)), data=df)
plot(fit2)




## To plot AUC-ROC
plot(df$mathCategory, predict(fit1, type="response"), notch=T)

## Create a new data set to use as test set
df2 <- generateData(10000)
actual <- df2$mathCategory=="High"
predicted <- predict(fit1, newdata=df2, type="link")
head(predicted)
head(actual)

library(pROC)
plot.roc(actual,predicted)
hist(predict(fit1, newdata=df2, type="response"), breaks=30)
hist(predict(fit1, newdata=df2, type="link"), breaks=30)


## Save the data into a csv file. Be sure to delete the "additional parameters"
df11 <- df
df11$prob <- NULL
df11$score <- NULL
colnames(df11) <- c("Age", "20 M Shuttle run Avg. speed", "Total Energy Intake/day", "Total Protein Intake/day", 
                  "Total Fat Intake/day","Total Carb Intake/day", "Gender", "School Name", "Weight", "Height", "BMI", "Economic Status","Aerobic Capacity" ,"score","prob","Math Score","English Score")

write.csv(df11,file="C:\\Lakshmi\\MSHI\\GitHub\\hs-616\\Data Simulation Project\\data.csv")

## Helper function to calculate cooefficients
logistic <- function(t) 1 / (1 + exp(-t))
library(manipulate)
manipulate({
  df1 <- transform(df, score = 10^a * (aerobicCap - mean(aerobicCap)) + 10^b * (energyIntake - mean(energyIntake)) + 
                     10^c * (bmi - mean(bmi)) - 2.1)
  df1$prob <- logistic(df$score)
  hist(df1$prob, breaks=50)
}, a=slider(-9, 9, step=0.1, initial = 0), b=slider(-9, 9, step=0.1, initial = 0), c=slider(-9, 9, step=0.1, initial = 0))



