#import packages
library("ggplot2")
library("dplyr")

#Question 1

#read text file into dataframe
#file compares predicted severity of mutation with severity of clinical symptoms
scores <- read.table("scores.txt", header=TRUE, sep="\t", stringsAsFactors = FALSE)

#Make scatterplot with trendline
ggplot(data = scores,
       aes(x=MMS, y=COS)) +
  geom_point(color="purple") +
  xlab("Mutation Severity Score") +
  ylab("Clinical Severity Score") +
  stat_smooth(method="lm") +
  theme_classic()


#Question 2

#read text file into dataframe
obs <- read.table("data.txt", header=TRUE, sep=",", stringsAsFactors = FALSE)

#Find means for each region
gd <- obs %>%
  group_by(region) %>%
  summarise(
    observations = mean(observations)
  )

#Make barplot of mean observations
ggplot(gd, aes(x=region, y = observations )) +
  geom_bar(stat = "identity") +
  theme_classic() 

#Make scatterplot of data
ggplot(data = obs, 
       aes(x=region, y=observations)) +
  geom_jitter(color = "pink") +
  theme_classic()

#The barplot shows just the means, which make the observations from each region look similar
#However, the scatterplot shows the variation and gives a better look at the overall dataset
#For example, the south region had a mean close to 15 but the observations were actually higher or lower
#Alternatively, the north region had observations that were all very close to 15