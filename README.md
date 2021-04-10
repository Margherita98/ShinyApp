# Coding for data science, R project: A ShinyApp to visualize statistics of NEET people in Italy 
### Midterm exam of Margherita Maroni, badge number: 965589

I created a ShinyApp to eveluate the incidence of **NEET** people in Italy. NEET is an acronym for **"Not in Education, Employment, or Training"** and it refers to a person who is unemployed and not receiving an education or vocational training. 
The percentage of NEET people on the whole italian population is quite high: in Italy, near 20% of people are living in this situation. The percentage is either higher when we analyze regions in Southern Italy, where the mean of NEET people is around 30%. 

I decided to do my ShinyApp on NEET people because I think that it is a very **dangerous social phenomenon** to which politics does not pay enough attention. Even though the Italian Institute of Statistics (**ISTAT**) displays a lot of data regarding NEET people aged between 15 and 34 years old, nobody talks about them. 
I took the data from Istat (<http://dati.istat.it/Index.aspx?DataSetCode=DCCV_NEET1>) and I selected NEET people between 15 and 29 years old, both male and female. 


## Required packages:
**Install necessary packages** 

First of all, in order to run my ShinyApp, you need to install the following packages: 
```R
install.packages('shiny')
install.packages('shinythemes')
install.packages('ggplot2')
install.packages('plotly')
```
Then, you should recall the packages with the libraries: 
```R
library(shiny)
library(shinythemes)
library(ggplot2)
library(plotly)
```

## Run the App:
**Execution of the App**

Then, you can execute the App, running the following code:

```R
shiny::runGitHub('ShinyApp', 'Margherita98', ref='main')
```

## What you will be displayed:

It will result in a ShinyApp with two tabPanel:

- The first one is a Bar Plot that shows the percentage of NEET people in each Italian region. You can select a region, a macro area of Italy (North, South, Center) or Italy itself. Then, you can select the gender: male, female or a variable I called 'total' that contains the mean between male and female NEET people. The numbers that you see on the bars represent the percentage of NEET italian young people for all the three years under consideration (2018-2019-2020)

- The second tabPanel is a boxplot: I decided to perform some basic statistical analysis. When you select the gender on the left, you are displayed three boxplots (one for each year). The three boxplots are interactive: you can see the minimum and the maximum value, the median of each year and the quartiles' distribution of NEET people 


