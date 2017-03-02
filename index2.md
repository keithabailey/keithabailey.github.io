---
title       : Exploring the Central Limit Theorem Through random number generation
subtitle    : Date - 2017-01-01
author      : Keith Bailey
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



## Start with building some initial data and looking at the method

- Build data frame of randomly generated numbers - we will use this throughout to


```r
k <- data.frame(x= numeric(0), size= numeric(0))

charts<-4
nosim<-25
for (mul in 1:charts){
  x <- apply(matrix(sample(1 : 6, nosim * mul, replace = TRUE), 
                    nosim), 1, mean)
  x<-data.frame(x,size=mul)
  k<-rbind(k,x)
}
k<-as.data.frame(k)
```

---



## Sample Size 25, 50, 75, 100
- The shiny app available, shows how we can explore the central limit theorem; Below shows the shiny output that would be achieved with 4 charts and sample size of 25 for the left chart.
<iframe src="wp2.html" width=100% height=10% allowtransparency="true"> </iframe>

--- 

## Sample Size 25, 50, 75, 100

- We can see from these charts that as the number of observations goes up, estimate of the mean from each sample begins to look more and more normal
- Next we will increase the base sample size to be 250 to see how much more normal our data will become
- Using the shiny app, we can quickly and easily investigate the impact the number of trials an observations has on how close our sample is to the population from which we are sampling
- This tool is very much designed to help students understand why we can rely on samples statistics being accurate estimates of the population from which we are sampling
- I decided this would be useful following the statistical inference course; I had to build something similar to have this stick in my head and think other can benefit from this.
- What follows is a description of how to read the charts produced as a how to on the tool is available on the shiny page.


--- 



## Sample Size 250 >> 1000

- Even with a sample size of 250 + we can see that it is not perfectly normal; Let us try to really push the observations up highly and see what happens

<iframe src="wp3.html" width=100% height=10% allowtransparency="true"> </iframe>

---




## Sample Size 250, 500, 750, 1000

- "The central limit theorem states that given a large sample size from a population the mean of all samples will be approximately equal to the mean of the population" {quote investopedia}. This tool helps us explore this.

<iframe src="wp4.html" width=100% height=10% allowtransparency="true"> </iframe>

