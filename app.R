#install.packages('shiny')
#install.packages('shinythemes')
#install.packages('ggplot2')
#install.packages('plotly')
library(shiny)
library(shinythemes)
library(ggplot2)
library(plotly)

if (!require("pacman")) install.packages("pacman")
pacman::p_load(shiny, ggplot2, plotly, shinythemes)

#Load my data
neet <- read.csv2('https://raw.githubusercontent.com/Margherita98/ShinyApp/main/NEET.csv')
neet

regions <- neet[1:180,]

# Define UI
ui <- navbarPage("R Project: Neet people in Italy",
                 theme = shinytheme("flatly"),
                  tabPanel("Barplot by region and gender",
                           
                           sidebarLayout(
                             sidebarPanel(
      selectInput("regions", "Select the region or the area of Italy:", 
                  unique(neet$REGIONS)),
      selectInput("gender", "Select the gender:",
                  unique(neet$GENDER)),
      hr(),
      helpText("Data from Istat")),
    
  mainPanel(
    titlePanel('Comparison of neet people incidence (2018-2019-2020)'),
    plotlyOutput("neet_plot"),
  )
)
),
tabPanel("Statistical analysis: boxplot",
         sidebarLayout(
           sidebarPanel(
    selectInput("gender1", "Select the gender to see the distribution:", 
                unique(regions$GENDER)),
    hr(),
    helpText("Data from Istat")),
  
  mainPanel(
    titlePanel('Distribution of neet people by gender'),
    plotlyOutput("boxplot"),
  )
)
)
)

#Define server
server <- function(input, output){
output$neet_plot <- renderPlotly(
  ggplot(data=subset(neet,(REGIONS == input$regions & GENDER == input$gender)), aes(x = factor(YEAR), y = VALUE )) + 
    geom_bar(stat = 'identity', color = 'violetred', fill='pink', width = 0.5) + 
    geom_text(aes(label = VALUE), vjust=5, size=5, color='white') + labs(x='Year of reference', y='Percentage of neet people')
 
)
output$boxplot <- renderPlotly(
  ggplot(subset(regions, (GENDER == input$gender1)), aes(x = factor(YEAR), y = VALUE))+ 
    geom_boxplot(color = 'violetred', fill = 'pink') + labs(x='Year', y='Percentage of neet people')  
)
}
shinyApp(ui=ui, server=server)

