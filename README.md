# Coding for data science, R project: A ShinyApp to visualize statistics of NEET people in Italy 
### Midterm exam of Margherita Maroni, matriculation number: 965589

I created a ShinyApp to eveluate the incidence of NEET people in Italy. NEET is an acronym for "Not in Education, Employment, or Training" and it refers to a person who is unemployed and not receiving an education or vocational training. 
The percentage of neet people on the whole italian population is quite high: in Italy, near 20% of people are living in this situation. The percentage is either higher when we analyze regions in Southern Italy, where the mean of NEET people is around 30%. 

I decided to do my ShinyApp on NEET people because I think that it is a very dangerous social phenomenon to which politics does not pay enough attention. Even though the Italian Institute of Statistics displays a lot of data regarding NEET people aged between 15 and 34 years old, nobody talks about them. 
I took the data from Istat and I select neet people between 15 and 29 years old, both male and female. 

## Install useful packages 
First of all, in order to run my ShinyApp, you need to install or recall these libraries: 
```R
library(shiny)
import.packages('shinythemes')
library(shinythemes)
library(dplyr)
library(ggplot2)
library(ggplotly)
```

## Execution of the App 
Then, you can execute the App, running the following code:

```R
shiny::runGitHub('ShinyApp', 'Margherita98', ref='main')
```

## What you will be displayed 
It will result in a ShinyApp with two tabPanel: 
- The first one is a Bar Plot that shows the percentage of neet people in each Italian region. You can select a region, a macro area of Italy (North, South, Center) or Italy itself. Then, you can select the gender: male, female or a variable I called 'total' that contains the mean between male and female NEET people. The numbers that you see on the bars represent the percentage of NEET italian young people for all the three years under consideration (2018-2019-2020).
- The second tabPanel is a boxplot; :I decided to perform some basic statistical analysis. When you select the gender on the left, you are displayed three boxplots (one for each year). The boxplots are interactive: you can see the median and the quartiles' values. 

