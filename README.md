# Mall-Customer-Segmentation

# Table of Contents

* [Source and Project Code](Source and Project Code)
* [Project Introduction and Motivation](Project Introduction and Motivation)
* [Methods Used](Methods Used)
* [Project Highlights](Project Highlights)
* [Procedure](Procedure)
    * [Data Cleaning and Exploratory Data Analysis](Data Cleaning and Exploratory Data Analysis)


### Source and Project Code 
This data was originally designed for Udemy's Machine Learning A-Z Course, though it can be found [here](https://github.com/PatrickJWalsh/Mall-Customer-Segmentation/blob/master/Mall%20Customers.csv).  

All project code can be referenced [here](https://github.com/PatrickJWalsh/Mall-Customer-Segmentation/blob/master/Mall%20Customer%20Clustering.R).

### Project Introduction and Motivation
The dataset is a customer database of a mall.  It contains 200 observations with basic information such as age, gender, annual income, and spending score.  The purpose of this analysis is to uncover underlying patterns in the customer base, and to group them accordingly, often known as market segmentation.  In doing so, the marketing team can have a more targeted approach to reach consumers, and the mall can make more informed strategic decisions to drive profit. 

### Methods Used
All Analysis was performed in R. Small tables (bucketed customer age, spending tiers, and cluster centers) were formatted in Excel.

* Exploratory Data Analysis and Descriptive Statistics
* Data Visualization
* Unsupervised Machine Learning (K-Means Clustering)

## Project Highlights
* Clustered data into 6 customer segments based on age, income, and spending score, facilitating targeted marketing to decrease customer acquisition cost and to increase customer retention
* Identified ideal segments to focus on given their potential increase in lifetime value
* Recommended initiatives such as creating/revamping a loyalty program, optimizing the marketing mix, tailored promotions, and enhancing the in-store experience as levers to drive traffic and increase revenue   

![Plot of Clusters](https://user-images.githubusercontent.com/71853253/95225835-380b8780-07ca-11eb-9fcd-9b0240791ba1.png)

![image](https://user-images.githubusercontent.com/71853253/95238012-ecaba600-07d6-11eb-8e9b-45365182fc36.png)

1)	The first cluster consists of younger shoppers who have moderate levels of income and spending score.  This cluster consists of people who can likely transition into more loyal customers given they are already frequent visitors who have a reasonable level of disposable income.  In-store promotions and a revamped loyalty program could incentivize this group to become higher spenders.  It helps that this cluster is young (mean age of 27), as reaching them shouldn’t be difficult considering the majority of customers are under 40, so current marketing tactics are likely effective.
2)  The sixth cluster presents another interesting opportunity.  Accounting for nearly 17% of customers, this cluster represents high income, but low spending score individuals.  This group certainly has the financial means to spend more within the mall, however, they likely consume through other channels (other store outlets, online shopping), so more effort needs to be put towards getting them into the mall. Enhancing the in-store experience should help create a more viable alternative to their current purchasing outlets.  Stores with customer journeys that cannot be easily replicated online should take full advantage (such as fitting clothes in person, in-person demonstrations of technology, etc.)  Additionally, implementing click and collect and other features to expedite the ordering process can provide the convenience that this segment seeks.  Finally, a mean age of 42 communicates that this segment likely consists of parents of young children, so promotions and product offerings catered towards that demographic should be emphasized as well.  
3)	The second cluster is the largest, accounting for nearly 23% of customers.  Similar to the fourth cluster, this group possesses a moderate spending score and income, so they likely possess the means to spend more within the mall.  On the other hand, this demographic is older (mean of 56 years old), so the lifetime value of these customers may not be as high as the younger individuals in the same financial bracket.  That coupled with the fact that a different marketing mix would likely be used to reach this group means it is not necessarily the best use of resources.  Customer acquisition cost and expected lifetime value should be considerations here.  
4)	The fifth cluster is the wealthiest segment, and already the most loyal.  Prioritizing this group might seem enticing, and may reap rewards, but given that this segment is already extremely loyal, targeting this group doesn't seem necessary to drive purchases.  The resources can be better spent elsewhere to move the needle on customers who have the financial means to purchase more than they currently are, but who also need to be enticed with an additional value proposition.  
5)	The third and fourth clusters are lower income individuals, and though the third cluster has a considerable spending score, these groups are the smallest segments and will have a tough time spending more money than they are already, so these groups are lower priority segments.  

## Procedure

* __Data Cleaning and Exploratory Data Analysis__
* __Model Building and Tuning__

### Data Cleaning and Exploratory Data Analysis
First, I wanted to understand the distribution of the variables. 

![image](https://user-images.githubusercontent.com/71853253/95258285-84b78880-07f3-11eb-9670-9dd85e3312dc.png)

56% of customers are female, and 44% are male, a considerable difference.

![image](https://user-images.githubusercontent.com/71853253/95249575-e3c2d080-07e6-11eb-968b-59065613a08d.png)
![image](https://user-images.githubusercontent.com/71853253/95251194-31d8d380-07e9-11eb-9840-13f407292b22.png)

The most represented age group is between 30-39. Intuitively, this makes sense, as many of these individuals are likely parents who are buying for their young kids.  The older group (55+) is not nearly as represented, and this can be due to the aging of their kids to an age when they can purchase for themselves (18+), as well as a change in lifestyle (retiring and moving).  Otherwise, this could reflect the underlying demographic of the nearby towns.

![image](https://user-images.githubusercontent.com/71853253/95249637-fc32eb00-07e6-11eb-958f-e6572078b64f.png)

The customers seem to be somewhat normally distributed with respect to income, with 60-90K representing the income of most customers. Very few individuals with incomes over 120K are purchasing at the mall, which may be indicative of the underlying population of the town, or that the wealthier individuals are consuming more from other outlets (other stores, or online).  This breakdown is important from both a marketing and strategic standpoint.  From a marketing point of view, are there behaviors generalizable across individuals of different income groups?  An understanding of consumption of TV, online media, and other advertising mediums can be leveraged to reach individuals of specific income groups.  We do know that individuals within the 60-90k income bracket are visiting this mall more often than other groups, so they would likely be receptive to in-person advertisements (storefront signs, in-store promotions, coupons, etc.)  Additionally, without more knowledge of the cost of living in the area, it is somewhat safe to say much of the consumer base has considerable spending power. 

![image](https://user-images.githubusercontent.com/71853253/95249814-40be8680-07e7-11eb-9b3e-3a4b099744e2.png)

The distribution is somewhat normalized as well, with the spending scores between 40-60 appearing most frequently among the customers (and 63% of consumers within 1SD of the mean of 50.2).  This distribution illustrates that there are a substantial amount of customers who are “somewhat frequent visitors”, or “moderate purchasers” who likely have the means to become more loyal customers.  Had the distribution been more concentrated on the ends of the spectrum (high concentrations of spending score < 30 and high concentration > 70), I believe it would be more concerning, as converting those low spending score customers into higher spending score customers would be difficult if the underlying driver to their spending behavior is their income.  Given the current state, there should be two objectives.  The first is to acquire new customers, and if the distribution of new customers is similar to that of the current one (assumes no improvement in targeted marketing), a substantial amount of them will have the spending power to be at least moderate purchasers.  The second focus should be on shifting the current consumer base primarily from moderate spenders to loyal customers, and incorporating new incentives and/or a loyalty program should encourage this.    

### Recap of EDA
We have learned the following through the initial data exploration.

-	Female skew (58% of all customers), 
-	Young-middle age demographic (77.5% of customers between age 20-49)
    - 7.5% between 20-29
    - 30.5% between 30-39
    - 9.5% between 40-49
-	Most customers are middle to upper-middle class (60-90K income), mean = 60.56K
-	Medium Spending score individuals make up the majority of the dataset
    - Mean of 50.2
    - SD = 25.8
    - 63% of customers within 1 SD (between 25-75)

### Further EDA

Next, I decided to examine the relationship between variables.

![image](https://user-images.githubusercontent.com/71853253/95254906-9ba7ac00-07ee-11eb-82e5-09155e988c92.png)

There is not much correlation between variables, though there is a slight inverse relationship between age and spending score (-.33), for reasons potentially highlighted before.  Though strong correlation is not present in many of these variables, I still think it is important to explore their relationship, as trends may emerge within subsets of the data.

#### Age and Gender
*We know the population at large is female skewed, and that the most represented age group is 30-39, but what is the distribution of gender by age?*

![image](https://user-images.githubusercontent.com/71853253/95258030-2b4f5980-07f3-11eb-852d-f6ee2316cc55.png)
![image](https://user-images.githubusercontent.com/71853253/95251194-31d8d380-07e9-11eb-9840-13f407292b22.png)

We can see that the gender split is fairly equal among those in their twenties, or above 50.  For people between 30-49, the distribution is skewed towards females (61% of customers aged 30-39 and 62% of customers aged 40-49 are female).  This supports the idea that this group may comprise of mothers of young children.

#### Income and Spending Score
*Is there a relationship between income and spending score (by gender)?*
![image](https://user-images.githubusercontent.com/71853253/95258819-49698980-07f4-11eb-8f62-4515be29742d.png)

It is difficult to identify a clear relationship between income and spending score, however, clusters do appear to form within the data.  It is difficult to interpret the relationship btween gender and spending score with this plot, so more testing should be done.

#### Age and Spending Score
*Is there a relationship between age and spending score?*
*We know the two features have an inverse relationship at the aggregate level, but it is still important to understand the distribution.*

![image](https://user-images.githubusercontent.com/71853253/95259401-1ecc0080-07f5-11eb-9059-933120b9b544.png)

The inverse relationship is fairly clear.  Interestingly, all of the highest spending individuals are between the ages 20 and 40.  The decline in spending seems to drop off sharply for customers who are 40 years old, at which point the spending score seems to level off.  Interestingly, almost all individuals over 65 years old are moderate spenders, and this is an insight that could not be communicated through simple correlation between the two variables.  This age group is likely made up of grandparents who are shopping for their young kids. 

#### Gender and Spending Score
*What is the breakdown of gender by spending score?*

![image](https://user-images.githubusercontent.com/71853253/95260671-1bd20f80-07f7-11eb-9c9e-b323ee63f855.png)
![image](https://user-images.githubusercontent.com/71853253/95260688-2391b400-07f7-11eb-8b65-40fd538d9f34.png)

It seems that females make up the majority of medium and high spend customers.  With a bit of feature engineering, we can bin these spending scores into tiers (low-high) to communicate this.  In doing so, we find that there is an increase in the proportion of females as the spending tier increases (albeit slight increase). 


### Key Takeaways from EDA
We were able to dig deeper to understand relationship between variables

- Age 30-39 accounts for 30.5% of all cusomters, and 61% of this age group are women
- No clear relationship between income and spending score, though clusters seem to form
- Spending score is highest among those aged 20-39, and drops off at 40 
    - Customers older than 65 are almost all moderate spenders
- Proportion of women increases with spending tier (made possible through feature engineering)

After the exploratory phase, we have already communicated multiple insights that are valuable for the mall.  An understanding of the prevalnce of specific characteristics within the customer base should be leveraged to tailor marketing and revenue strategies.  


### Building the Model

Standardizing data is a good practice when clustering, as the range of values within each feature will influence how the cluster is formed, which is not usually desirable.  Kmeans clustering uses Euclidean distance to measure the similarity between objects, so if a feature has a range much larger than another feature, it will dominate the other features in the clustering process. 

The model was initiated on the standardized data to cluster based on age, income, and spending score.

### Tuning the Model

When using Kmeans, the number of clusters (k), is a value to be set by the user.  There are a few methods to determine the appropriate number of clusters, as shown below.

### Elbow Method

![image](https://user-images.githubusercontent.com/71853253/95271800-c7d22580-080c-11eb-9557-d30eb1232fcd.png)

The within-cluster sum of squares is a measure of the variability of observations within each cluster.  A smaller sum of squares creates a more "compact" cluster, which is usually preferred.  The elbow method seeks to optimize the number of clusters by selecting the number of clusters that minimize the within-cluster sum of squares before diminishing returns takes place.  As the number of clusters increases, the sum of squares will decrease, as the data is being broken into a larger number of "tighter" clusters.  The key is to select the number of clusters at which point we can account for a substantial amount of variance within the data while also not overfitting, and the "elbow" forms at a point where the addition of a cluster results in a relatively minimal decrease in error.  Given the above plot, one could say that clusters between 4 and 6 would be optimal, so I decided to use 6 clusters, as this number would provide the most compact clusters, and thus the most detailed information about the customers.  Choosing to have fewer clusters would result in looser associations between datapoints, minimizing the amount of meaningful takeaways that can be deduced. 

### Gap Statistic Method 

![image](https://user-images.githubusercontent.com/71853253/95276712-f7d3f580-0819-11eb-9dd0-0ba95533f5f6.png)

The gap statistic compares the total intracluster variation for different values of k with their expected values under null reference distribution of the data (i.e. a distribution with no obvious clustering). The reference dataset is generated using Monte Carlo simulations of the sampling process.  The goal is to maximize the gap-stat, though assuming that the plot is just going to continue to increase, of course, the results are less useful. Tibshirani suggests the 1-standard-error method:

Choose the cluster size k^ to be the smallest k such that Gap(k)≥Gap(k+1)−sk+1.

Which translates to identifying the point at which the rate of increase of the gap statistic begins to "slow down".

### Average Silhouette Method

![image](https://user-images.githubusercontent.com/71853253/95277064-e63f1d80-081a-11eb-97de-77d20af142b0.png)

Silhouette analysis allows you to calculate how similar each observation is with the cluster it is assigned relative to other clusters. This metric ranges from -1 to 1 for each observation in your data and can be interpreted as a poor fit (-1), a loose fit that is borderline between clusters (0), and a great fit (1).  Maximizing the silhouette metric is the goal, and should yield the optimal amount of clusters.

Given all of the above, I felt most comftorable moving forward with 6 clusters.

### Tuned Model

![image](https://user-images.githubusercontent.com/71853253/95274098-ea673d00-0812-11eb-998b-e7c4f154e7cd.png)

This is a matrix of clusters built on two-variable combinations of age, income, and spending score.

After tuning the model to have 6 clusters, the clusters explained 78% of the variance within the data. 

The  *factoextra* package was used to create the final cluster plot, as it performs principal component analysis on the features.  The cluster centers were then unscaled and the results can be seen under "Project Highlights."

 




