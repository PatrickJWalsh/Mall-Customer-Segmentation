
##Loading in File
setwd("C:/Users/patjw/Downloads/Tech Stuff")
df <- read.csv("Mall Customers.csv")

###Packages
install.packages("ggplot2")
install.packages("plotly")
install.packages("ggthemes")
install.packages("corrplot")
install.packages("dplyr")
install.packages("caTools")
install.packages("factoextra")


library(ggplot2)
library(plotly)
library(ggthemes)
library(corrplot)
library(dplyr)
library(caTools)
library(RColorBrewer)
library(cluster)
library(factoextra)

### Data Cleaning 
head(df)
str(df)

## Checking for Na & Nulls
sum(is.na(df))
sum(is.null(df))

###Renaming Spening Score and Annual Income
df <- rename(df, Income = Annual.Income..k..)
df <- rename(df, SpendingScore = Spending.Score..1.100.)
colnames(df)
summary(df)

#Data Exploration
##Gender Breakdown
genderplot <- ggplot(df, aes(x=factor(1), fill=Gender))+
  geom_bar(width = 1) +
  coord_polar("y")
genderplot

table(df$Gender)/nrow(df)

## Plot Customers by Age
Plotage <- ggplot(df,aes(x=Age))
Plotage + geom_histogram(fill="purple", alpha = 0.7)

##Bucket Age by 10s
Twenties <- filter(df, Age <30)
table(Twenties$Gender)

Thirties <- filter(df, Age >= 30 & Age <= 39)
table(Thirties$Gender)

Fourties <- filter(df, Age >= 40 & Age <= 49)
table(Fourties$Gender)

(nrow(Twenties) + nrow(Thirties) + nrow(Fourties)) / nrow(df)

FiftiesPlus <- filter(df, Age >= 50)
table(FiftiesPlus$Gender)
table(FiftiesPlus$Income)

## Plot by Income
Plotincome <- ggplot(df, aes(x= Income))
Plotincome + geom_histogram(fill="orange", alpha = 0.7)
mean(df$Income)

## Plot by Spending Score
Plotscore <- ggplot(df, aes(x = SpendingScore))
Plotscore + geom_histogram(fill="brown", alpha = 0.8)
mean(df$SpendingScore)
sd(df$SpendingScore)
OneSD_SpendingSCore <- filter(df, SpendingScore >= 24 & SpendingScore <= 76)
nrow(OneSD_SpendingSCore) / nrow(df)  ## % of people within 1SD

##Creating a Binary Male/Female Column in case Gender will be used as numerical value
df$Male <- ifelse(df$Gender == "Male", "1", 0) 
df$Male <- as.numeric(df$Male)

str(df$Male)

##Creating Subset for purpose of using numerical male/female
dfmale <- subset(df, select = -c(Gender))
head(dfmale)


### Deeper Exploration - Relationships b/t Variables
##Correlation between variables
Correlation <- cor(dfmale)
corrplot(Correlation,order ="hclust", col = brewer.pal(n=8, name = "RdBu"))
corrplot(Correlation, method = "number")
cor(dfmale)

## Histogram of Age and Gender
Plotagegender <- ggplot(df, aes(x = Age)) 
Plotagegender + geom_histogram(aes(fill = factor(Gender)))

table(Thirties$Gender)

##Scatter of Income and Spending Score, colored by gender
scatter <- ggplot(df, aes(x = Income, y = SpendingScore)) + geom_point(aes(size = 2, color = factor(Gender)))
scatter + geom_smooth(method = "lm", color = "black")

##Scatter of Age and Spending Score, colored by Gender
scatter2 <- ggplot(df, aes(x = Age, y = SpendingScore)) + geom_point(aes(size = 2, color = factor(Gender)))
scatter2 +geom_smooth(method = "lm", color ="black")

##histogram of Gender and Spending Score
Genderscore <- ggplot(df, aes(x = SpendingScore))
Genderscore + geom_histogram(aes(fill= factor(Gender)))

##Assign Low, Medium, High Values to Spending Score
df$spendscale <- ifelse(df$SpendingScore <34, "low", ifelse(df$SpendingScore >= 34 & df$SpendingScore <= 67, "medium", "high"))
head(df$spendscale)

table(df$spendscale, df$Gender)

###Standardizing the Variables
dfstandardized <- select(df, c(Age, Income, SpendingScore))
dfstandardized <- as.data.frame(scale(dfstandardized))

##K Cluster Model
set.seed(101)
Cluster1 <- kmeans(dfstandardized[,1:3],4,nstart=100)
print(Cluster1)

##Tweaking the Model 
#Computing WSS ### Elbow Method
k.max <- 15
wss <- sapply(1:k.max,
              function(k){kmeans(dfstandardized[,1:3],k, iter.max = 100, nstart = 100)$tot.withinss})
wss

#Plotting Elbow method
plot(1:k.max, wss,
     type = "b", pch = 19, frame = FALSE,
     xlab = "Number of clusters K",
     ylab = "Total within-clusters sum of squares")

###Adjusting Kmeans Model
Cluster6 <- kmeans(dfstandardized[,1:3],6,iter.max=100, nstart=100)
Cluster6

plot(dfstandardized[,1:3], col=Cluster6$cluster)

Cluster6$centers

##Visualize the data, Clustering on Age, Income, and Spending Score
install.packages("factoextra")
library(factoextra)
bold_axis <- element_text(face = "bold", color = "black", size = 20)
axis_text <- element_text(face = "bold", size = 14)

fviz_cluster(Cluster6, data = dfstandardized[,1:3], label = 0, main = "Clusters on Age, Income, and Spending Score") + theme(axis.text = axis_text) + theme(title = bold_axis)









