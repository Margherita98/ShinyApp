# A ShinyApp to visualize statistics of NEET people in Italy 
### Midterm exam of Coding for data science, R project 
### Margherita Maroni, badge number: 965589

If you like to visualize the app from smartphone and computer you can click on: <https://neetpeople.shinyapps.io/shinytodeploy/>

I created a ShinyApp to eveluate the incidence of **NEET** people in Italy. NEET is an acronym for **"Not in Education, Employment, or Training"** and it refers to a person who is unemployed and not receiving an education or vocational training. 
The percentage of NEET people on the whole italian population is quite high: in Italy, near 20% of people are living in this situation. The percentage is either higher when we analyze regions in Southern Italy, where the mean of NEET people is around 30%. 

I decided to do my ShinyApp on Italian NEET people because I think that it is a very **dangerous social phenomenon** to which politics does not pay enough attention. Even though Italy is the worst European Country for education, nobody does anything to help these category of people. 
I think we should all be aware that there some peers of us who are living one of the worst social and psychological situation ever. The Italian Government and the Ministry of Education should do something to aid these young unlucky people. 

I took the data from the Italian Institute of Statistics **Istat** (<http://dati.istat.it/Index.aspx?DataSetCode=DCCV_NEET1>) and I selected NEET people between 15 and 29 years old, both male and female. 

There are two tabPanels that can be selected in the upper panel: 
```
Comparison of NEET people incidence (2018-2019-2020)
Distribution of NEET people by gender
```
## Section 1: Comparison of NEET people incidence (2018-2019-2020) 
In this section there is is a barplot that shows the percentage of NEET people in each Italian region. 
From the side bar panel you can select: 

- One of the 20 ```Italian Regions```
- A macro area of Italy (``` North, South and Centre```)
- ```Italy```

Then, you can select the gender you want to plot: 

- ```male``` if you desire to see the increase of male young NEET people 
- ```female``` to see the increase of female young NEET people
- ```total``` that is computed as the average of the ```male``` and ```female``` young NEET Italian people. 

The numbers that you see printed on the bars represent the percentage of NEET italian young people for all the three years under consideration (2018-2019-2020). 
The barplot are interactive, if you move the cursor on them you will visualize the percentages of each year. 


## Section 2: Distribution of NEET people by gender
In this section you are displayed a boxplot where I performed some basic statistical analysis. For this purpose I reduced my dataset creating a subset that contains only the ```Italian Regions```, excluding the macro areas such as North, South and Centre,  and also excluding the aggregate data regarding Italy.

On the side bar panel you can select the  ```gender``` you want to plot: 

- ```male``` if you desire to see the increase of male young NEET people 
- ```female``` to see the increase of female young NEET people
- ```total``` that is computed as the average of the ```male``` and ```female``` young NEET Italian people. 

The results are always three boxplots: one for each year. The boxplots are interactive too: if the user moves the cursor, it is possible to visualize the **minimum** and the **maximum** value, the **median** of each boxplot and the **quartiles' distributions** of NEET people.  


## Run the Shiny App 

If you want to run the application on your personal computer, you should previosly install R (follow this link: <https://cran.mirror.garr.it/CRAN/> , available for Linux, Mac - OSX, and Windows ) and RStudio (follow this link: <https://www.rstudio.com/products/team/>). 
Then, you should write the following command on your console: 

 ```shiny::runGitHub('ShinyApp', 'Margherita98', ref = 'main')``` 

