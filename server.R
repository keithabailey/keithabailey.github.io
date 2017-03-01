library(shiny)
library(ggplot2)
library(plotly)

k <- data.frame(x= numeric(0), size= numeric(0))

shinyServer(function(input,output){
  
  clt <- reactive({
    
    charts<-input$facets
    nosim<-input$slider1
    for (mul in 1:charts){
      print(apply(matrix(sample(1 : 6, nosim * mul, replace = TRUE), 
                         nosim), 1, mean))
      x <- apply(matrix(sample(1 : 6, nosim * mul, replace = TRUE), 
                        nosim), 1, mean)
      x<-data.frame(x,size=mul)
      print(x)
      k<-rbind(k,x)
      k
    }
    k<-as.data.frame(k)
    print(head(k))
    k
  }) 
  
  output$plot2<-renderPlotly({
    
    g<-ggplot(clt(), aes(x = x, fill = as.factor(size))) + geom_histogram(alpha = .20, binwidth=.25) +
      facet_grid(. ~ size) + scale_fill_discrete(name="Multiples of Observations") + theme(legend.position="none")
    ggplotly(g)%>% 
      layout(height = input$plotHeight, autosize=TRUE)
    
  })
})