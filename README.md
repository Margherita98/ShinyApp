# A ShinyApp to visualize statistics of NEET people in Italy 
### Midterm exam of Coding for data science, R project 
### Margherita Maroni, badge number: 965589

If you like to visualize the app from smartphone and computer you can click on: <https://neetpeople.shinyapps.io/shinytodeploy/>

I created a ShinyApp to eveluate the incidence of **NEET** people in Italy. NEET is an acronym for **"Not in Education, Employment, or Training"** and it refers to a person who is unemployed and not receiving an education or vocational training. 
The percentage of NEET people on the whole italian population is quite high: in Italy, near 20% of people are living in this situation. The percentage is either higher when we analyze regions in Southern Italy, where the mean of NEET people is around 30%. 

I decided to do my ShinyApp on NEET people because I think that it is a very **dangerous social phenomenon** to which politics does not pay enough attention. Even though the Italian Institute of Statistics (**ISTAT**) displays a lot of data regarding NEET people aged between 15 and 34 years old, nobody talks about them. 
I took the data from Istat (<http://dati.istat.it/Index.aspx?DataSetCode=DCCV_NEET1>) and I selected NEET people between 15 and 29 years old, both male and female. 

There are two tabPanels that can be selected in the upper panel: 
```R
Comparison of NEET people incidence (2018-2019-2020)
Distribution of NEET people by gender
```
## Section 1: Comparison of NEET people incidence (2018-2019-2020) 
It is a boxplot that shows the percentage of NEET people in each Italian region. You can select a ```R region```, a macro area of Italy (North, South, Center) or Italy with aggregated data. Then, you can select the ```R gender``` (male and female) and visualize the category you are interested in. In addition, it's possible to select a variable called 'total' that is the average of male and female NEET people. The numbers that you see on the bars represent the percentage of NEET italian young people for all the three years under consideration (2018-2019-2020). 
The barplot are interactive, if you move the cursor on them you will visualize the percentages of each year. 


## Section 2: Distribution of NEET people by gender
Here you are displayed a boxplot where I performed some basic statistical analysis. For this purpose I reduced my dataset creating a subset that contains only the italian regions, excluding the macro areas (North, South and Centre) and Italy.
The user has the possibility of selecting the ```R gender``` on the widget. The results are three boxplots: one for each year. The boxplots are interactive too: if the user moves the cursor, it is possible to visualize the minimum and the maximum value, the median of each boxplot and the quartiles' distribution of NEET people.  



.... 
