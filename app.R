library(shiny)
#import.packages('shinythemes')
library(shinythemes)
library(dplyr)
library(ggplot2)
library(readr)
library(lubridate)
library("readxl")

#Load my data
neet <- read_excel('/Users/margheritamaroni/Desktop/NEET/NEET.xlsx')
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
  titlePanel("Neet people by region and year"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("regions", "Select the region or the area:", 
                  unique(neet$REGIONS)),
      selectInput("gender", "Select the gender",
                  unique(neet$GENDER)),
      hr(),
      helpText("Data from Istat")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("linear_regression")),
    sidebarPanel(
      selectInput("years", "Select the GDP per year:", 
                  unique(neet$YEAR))),
      hr(),
      helpText("Data from Istat")
    )
)



server <- function(input, output){
  
  # Fill in the spot we created for a plot
output$neet_plot <- renderPlot(
  ggplot(data=subset(neet,(REGIONS == input$regions & GENDER == input$gender)), aes(x = factor(YEAR), y = VALUE )) + 
    geom_bar(stat = 'identity', color = 'violetred', fill='pink', width = 0.5) + 
    geom_text(aes(label = VALUE), vjust=5, size=5, color='white') + labs(x='Year of reference', y='Percentage of neet people')
 
)
}

shinyApp(ui=ui, server=server)
