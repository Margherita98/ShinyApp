## R PROJECT for the midterm exam 
# A shiny app to visualize and plot the incidence of NEET people in Italy for three years: 2018,2019,2020. 

#I use the package 'packman' to load and install all the required packages to properly run the app. 
if (!require("pacman")) install.packages("pacman")
pacman::p_load(shiny, ggplot2, plotly, shinythemes)

#Load my data from a csv on my GitHub repository: https://raw.githubusercontent.com/Margherita98/ShinyApp/main/NEET.csv
neet <- read.csv2('https://raw.githubusercontent.com/Margherita98/ShinyApp/main/NEET.csv')
neet

#Creation of a subset containing only the italian regions (20 regions). 
#I exclude the data regarding the three macro ares (North, South and Center) and those of Italy. 
#This choice helps me when I do the boxplot. 
#In this way I can select only the regions and the statistical analysis is not biased by unuseful information
regions <- neet[1:180,]

# Define UI - user interface
ui <- navbarPage("R Project: NEET people in Italy",
                 theme = shinytheme("flatly"),
                  tabPanel("Barplot by region and gender",
                           
                           sidebarLayout(
                             sidebarPanel(
      selectInput("regions", "Select the region or the area of Italy:", 
                  unique(neet$REGIONS)),
      helpText("Select a Region or a macro area of Italy or the entire Italian country. You will see how the incidence of NEET people increased in the last three years."),
      br(),
      
      selectInput("gender", "Select the gender:",
                  unique(neet$GENDER)),
      hr(),
      helpText("Select the gender you want to be displayed. The variable 'total' is the average between male and female percentages of NEET people."
      ),
      br(),
      helpText("Data are taken from the Italian Institute of Statistics (ISTAT)."
      ),
      br()),
    
  mainPanel(
    titlePanel('Comparison of NEET people incidence (2018-2019-2020)'
               ),
    plotlyOutput("neet_plot"),
    helpText("Note: Use the cursor to interact with the App."),
    br()
   
    
  )
)
),
tabPanel("Statistical analysis: boxplot",
         sidebarLayout(
           sidebarPanel(
    selectInput("gender1", "Select the gender to see the distribution:", 
                unique(regions$GENDER)),
    helpText("Select the gender to visualize a boxplot of 2018-2019-2020. You will be displayed a statistical analysis run only on the 20 italian regions."),
    br(),
    helpText("Data are taken from the Italian Institute of Statistics (ISTAT)."),
    br(),
    hr(),
    ),
  
  mainPanel(
    titlePanel('Distribution of NEET people by gender'),
    plotlyOutput("boxplot"),
    helpText("Note: Use the cursor to interact with the App."),
    br(),
    
  )
)
)
)

#Define server building
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

#Shiny App

shinyApp(ui=ui, server=server)

