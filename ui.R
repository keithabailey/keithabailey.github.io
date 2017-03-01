library(shiny)
library(ggplot2)
library(plotly)

shinyUI(fluidPage(
  
  title="Central Limit Theorem Exploration",
  
  
  plotlyOutput('plot2', height = "400px"),
  
  hr(),
  
  fluidRow(
    column(3,
           h4("Central Limit Theorem Exploration: Unbiased Die Rolls"),
           sliderInput("slider1", "Sample Size:",min = 1, max = 10000,step=1,value=100),
           sliderInput("facets", "Number of charts used for exploration:",min = 1, max = 4,step=1,value=2)
    ),
    column(6,
           br(),
           h4("How To Guide"),
           br(),
           ("The purpose of this tool is to aid in the exploration of the central limit theorem."),
           br(),
           ("For the purposes of this exploration we will generate a sample based on the Sample Size slider.
            If you select 1000 as the samlpe size, chart 1 (left hand side) will show the mean for each of 1000 trials each with 1000 random observations.
            We then plot these in a histogram to see if, as our sample sizes get larger, do we see a begin to see a normal distribution about the mean of the true population?")
           ),
    br(),
    ("You also have the ability to add more charts, to the exploration with the 'Number of Charts' slider."),
    br(),
    ("For each chart that is added, it will automatically increase the sample size. e.g. if your sample size is 1000, chart 1 will be based on 1000 trials of 1000 observations,
     chart 2 will be based on 1000 trials of 2000 observations and so on. This might not seem thta useful, but it can get noisy with many charts, but can also help to understand what is happening.")
    )
 )
)
