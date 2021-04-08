library(shiny)
#import.packages('shinythemes')
library(shinythemes)
library(dplyr)
library(ggplot2)
library(readr)
library(lubridate)
library("readxl")

#Load my data
neet <- read_excel('https://raw.github.com/Margherita98/ShinyApp/blob/main/NEET.xlsx')
neet

#example of ggplot
ggplot(data=neet, aes(x = factor(REGIONS),fill= factor(REGIONS)))+ 
  geom_bar(stat = 'identity', aes(y = MALE_2019, position = 'dodge')) + 
  geom_text(aes(y = MALE_2019, label = MALE_2019))

# Define UI


# Use a fluid Bootstrap layout
ui <- fluidPage(  
  theme = shinytheme("superhero"),
  
  # Give the page a title
  titlePanel("Analysis on neet people in Italy"),
  
  # Generate a row with a sidebar
      
    sidebarLayout(
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("regions", "Select the region or the area of Italy:", 
                  unique(neet$REGIONS)),
      selectInput("gender", "Select the gender:",
                  unique(neet$GENDER)),
      hr(),
      helpText("Data from Istat")),
    
  mainPanel(
    titlePanel('Comparison of neet people incidence (2018-2019-2020)'),
    plotOutput("neet_plot"),
  )
),
sidebarLayout(
  # Define the sidebar with one input
  sidebarPanel(
    selectInput("years", "Select the year to see the distribution:", 
                unique(neet$YEAR)),
    hr(),
    helpText("Data from Istat")),
  
  mainPanel(
    titlePanel('Distribution of neet people'),
    plotOutput("boxplot"),
  )
)
)

server <- function(input, output){
  
 

  
output$neet_plot <- renderPlot(
  ggplot(data=subset(neet,(REGIONS == input$regions & GENDER == input$gender)), aes(x = factor(YEAR), y = VALUE )) + 
    geom_bar(stat = 'identity', color = 'violetred', fill='pink', width = 0.5) + 
    geom_text(aes(label = VALUE), vjust=5, size=5, color='white') + labs(x='Year of reference', y='Percentage of neet people')
 
)

output$boxplot <- renderPlot(
  ggplot(subset(neet, YEAR == input$years), aes(x = as.factor(YEAR), y = VALUE)) + 
    geom_boxplot(color = 'violetred', fill = 'pink') + 
    coord_flip() 
)
}

shinyApp(ui=ui, server=server)
