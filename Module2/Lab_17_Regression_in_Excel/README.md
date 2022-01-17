![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Regression in Excel

## Introduction
As a data analyst you will have to work with a big amount of data. Extracting meaningful insights from your data can be done by dividing your data into subsets using Pandas library. It's a simple way to perform several types of analyses such as descriptive statistics.
In this lab, you will going to do Regression in Excel 

## Getting Started

Challenge 1
1.	Please download the file 'Task1_data.xlsx'. The metadata for the dataset is presented below:

| #Indicator Name | #Long definition | # Source | # Periodicity | # Aggregation method
| :-------------: | :--------------: |:-------: |:------------: |:-----------------: |
|Access to electricity (% of population)|	Access to electricity is the percentage of population with access to electricity. Electrification data are collected from industry, national surveys and international sources| World Bank Global Electrification Database from "Tracking SDG 7: The Energy Progress Report"| 	Annual |	Weighted average|

2.	Create a new tab and name it Statistics.
3.	Calculate: 
a.	the average value of the indicator for each year
b.	number of countries that are above average in 2019
c.	number of countries that are under average in 2019
4.	Create a bar chart that shows 10 countries with the lowest results in 2019. The chart should have the title, axes and data labels. Explain the chart 
5.	Create a line chart that shows the dynamics of the indicator for Eritrea and Bhutan. The chart should have the title, axes and data labels. Explain the chart
6.	Create a new tab “Prediction” and copy the column names and all the data for Burundi. Choose the appropriate regression model and provide the prediction for the next 2 periods. Explain the choice, quality of the model and the results.

Predictions for the next 2 periods:
2020		11,81938455
2021		12,63025444

My regression model has a R Square of 0.93 so it fits very well to the dataset: the model can explain 93% of variation in the dataset. 
P-value is lower than 5% so the variables are significant. 


Challenge 2
1.	Please download the file Task3_data.xlsx.
2.	Calculate the correlation between the variables. Comment

There is strong, negative correlation between Price and KM variables.

3.	Create the linear multiple regression model taking into account that “current price” is a dependent variable.
4.	Explain the value of the Adjusted R Square

Adjusted R Square provides information that my regression model fits to 87% of the dataset variation, so we can consider it's good enough. Since there is only one X variable here in my model (KM), looking at R Square would be enough.

5.	What the Standard Error is? Explain the value.

Standard Error explains the deviation from the mean: here, the values of my dataset being in tens and hundreds of thousands, SE is in given in tens of thousands: it reflects the magnitude of the variables. 

6.	Are the variables significant? Why?

P-values are lower than 5%: the variables are significant.

7.	What will be the value of the “Current price” if:

| #on road old	| #on road now | #years	| #km	| #rating	| #condition	| #top speed
|:-------------:|:------------:|:------:|:---:|:-------:|:-----------:|:---------:|
| 20000	| 54300	| 5	|  23459 |	2 |	3 |	150

With a multiple variables regression model, I get a Current Price of -64633,48 which is negative because the scale of this projection is different from the ones in my dataset (in hundreds of thousands for on road variables vs in tens of thousands for the projection).