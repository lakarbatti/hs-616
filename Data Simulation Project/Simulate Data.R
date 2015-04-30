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
# 
# Aerobic fitness has been shown to have several beneficial effects on child health. However, research on its 
# relationship with academic performance has been limited, particularly in developing countries and among 
# undernourished populations. This study examined the association between aerobic fitness and academic achievement 
# in clinically healthy but nutritionally compromised Indian school-aged children and assessed whether 
# micronutrient status affects this association. 273 participants, aged 7 to 10.5 years, were enrolled from 
# three primary schools in Bangalore, India. Data on participants' aerobic fitness (20-m shuttle test), 
# demographics, anthropometry, diet, physical activity, and micronutrient status were abstracted. School-wide 
# exam scores in mathematics and Kannada language served as indicators of academic performance and were 
# standardized by grade level. The strength of the fitness/achievement association was analyzed using 
# Spearman's rank correlation, multiple variable logistic regression, and multi-level models. Significant 
# positive correlations between aerobic capacity (VO2 peak) and academic scores in math and Kannada were 
# observed (P < 0.05). After standardizing scores across grade levels and adjusting for school, gender, 
# socioeconomic status, and weight status (BMI Z-score), children with greater aerobic 
# capacities (mL * kg-1 * min-1) had greater odds of scoring above average on math and 
# Kannada exams (OR=1.08, 95% CI: 1.02 to 1.15 and OR=1.11, 95% CI: 1.04 to 1.18, respectively). This association 
# remained significant after adjusting for micronutrient deficiencies. These findings provide preliminary evidence
# of a fitness/achievement association in Indian children. While the mechanisms by which aerobic fitness may be 
# linked to academic achievement require further investigation, the results suggest that educators and 
# policymakers should consider the adequacy of opportunities for physical activity and fitness in schools for 
# both their physical and potential academic benefits. 
#
# 
# Step 1 select the topic
# Step 2 read more information on the topic
# Step 3 Collect Mean and SD weight and height for population

aerobicCapVO2Max <- function (maxSpeed, age){
  return(31.025 + 3.238 * maxSpeed - 3.248 * age + 0.1536 * (maxSpeed * age))
}


# calcMath <- function(aerobic,energy,protein,fat,carb){
#   
#   meanAero <- mean(aerobic)
#   meanEnergy <- mean(energy)
#   meanProt <- mean(protein)
#   meanFat <- mean(fat)
#   meanCarb <- mean(carb)
#     
#   ifelse ((aerobic > meanAero) & (energy > meanEnergy) & (protein > meanProt) & (fat > mean(fat))
#                           & (carb > meanCarb),runif(N,88,100),runif(N,35,55))  
#   
# }
# 
# calcKannada <- function(aerobic,energy,protein,fat,carb){
#   meanAero <- mean(aerobic)
#   meanEnergy <- mean(energy)
#   meanProt <- mean(protein)
#   meanFat <- mean(fat)
#   meanCarb <- mean(carb)
#   
#   ifelse ((aerobic > meanAero) & (energy > meanEnergy) & (protein > meanProt) & (fat > mean(fat))
#           & (carb > meanCarb),runif(N,85,95),runif(N,25,50))
# }


generateData <- function(N=5000){

  ######### Statistical Data #####################
  heightMean <- c(F = 131.3, M = 130.85)
  heightSD <- c(F = 7.8, M = 6.7)
  weightMean <- c(F = 27.75, M = 27.98)
  weightSD <- c(F = 4.5, M = 3.5)
  gender <- sample(c("M", "F"), N, replace=TRUE, prob = c(0.498,0.502))
  school <- sample(c("School1", "school2", "School3"), N, replace=TRUE)
  weight <- rnorm(N,mean = weightMean, sd= weightSD)
  height <- rnorm(N,mean = heightMean, sd= heightSD)
  BMI <- function(height, weight) weight/height^2
  socioEconomicStatus <- sample(c("Low", "Medium", "High"), N, replace=TRUE)
  
  age <- runif(N,7,10.5)
  speed <- rnorm(N,mean=9,sd=2)
  
  #maxSpeed <- runif(1,10,20)
  aerobicCap <- aerobicCapVO2Max(speed,age)
  #grade <- sapply(age,gradeStud)
  
  #grade <- cut(age,breaks = 7:11,labels = paste("Grade",2:5),right =FALSE)
  grade <- cut(age,breaks = 7:11,labels = 2:5,right =FALSE)
  

  bmi <- BMI(height,weight)
  ########### Micronutrients data ###############
  proteinIntake <- runif(N,21.1,32.7)
  fatIntake <- runif(N,14.7,27.9)
  carbIntake <- runif(N,135,204)
  
  energyIntake <- proteinIntake *4 + fatIntake *9 + carbIntake * 4
  ############################################### 
  
  #scoreMath <- calcMath(N,aerobicCap,energyIntake,proteinIntake,fatIntake,carbIntake)
  #scoreKannada <- calcKannada(N,aerobicCap,energyIntake,proteinIntake,fatIntake,carbIntake)

  data.frame(age,speed,energyIntake,proteinIntake,fatIntake,carbIntake,gender,school,weight,height,bmi,socioEconomicStatus,
             aerobicCap)
}

library(manipulate)
manipulate({
  df <- transform(df, score = 10^a * (aerobicCap - mean(aerobicCap)) + 10^b * (energyIntake - mean(energyIntake)) + 
                  10^c * (bmi - mean(bmi)))
  df$prob <- logistic(df$score)
  hist(df$prob, breaks=50)
}, a=slider(-9, 9, step=0.1, initial = 0), b=slider(-9, 9, step=0.1, initial = 0), c=slider(-9, 9, step=0.1, initial = 0))

df <- transform(df, score = 10^-1 * (aerobicCap - mean(aerobicCap)) + 10^(-1.6) * (energyIntake - mean(energyIntake))+ 
                  10^2.7 * (bmi - mean(bmi)))
df$prob <- logistic(df$score)
hist(df$prob, breaks=50)

# The dummy outcome is calculated to classify the data into high performers and low performers
df$dummyOutcome <- factor(ifelse(df$prob > runif(N), 1, 0))

# The outcome is then masked into a range of outcome for high and low scores for two subjects
df$scoreMath <- factor(ifelse(df$dummyOutcome == 1, runif(N,88,100),runif(N,35,55)))
df$scoreEnglish <- factor(ifelse(df$dummyOutcome == 1, runif(N,85,95),runif(N,25,50)))
head(df)

