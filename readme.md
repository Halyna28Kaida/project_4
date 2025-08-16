
# SQL project

### ***Halyna Kaida***

The goal of this project is to prepare robust data that will allow us to compare food availability based on average wages over a certain period of time and answer questions prepared by colleagues from the analytical department for the upcoming conference presentation.

Here we have two files with table creating scripts:

* t_Halyna_Kaida_project_SQL_primary_final
* t_Halyna_Kaida_project_SQL_secondary_final

and five files with SQL queries:

#### 1. **Are wages increasing in all industry sectors over the years, or are they decreasing in some?**
 
The output shows that wages in some sectors are decreasing over the years. But here we do not have accurate output, because there are missing some values about sectors.

#### 2. **How many liters of milk and kilograms of bread can be purchased for the first and last comparable periods in the available price and wage data?** 

According the results in the year 2006 it was possible to buy 

* 1308 kg of a bread
* 1460 liters of milk.

In the year 2018 

* 1363 kg of a bread
* 1667 liters of milk.

#### 3. **Which food category is increasing in price the slowest (has the lowest percentage year-on-year increase)?**. 
 
The results show that some food products are not increasing in price at all - in fact, some are even decreasing. 

#### 4. **Is there a year in which the year-on-year increase in food prices was significantly higher than wage growth (greater than 10%)?**. 
 
Answer: No, there is no such year.
 
#### 5. **Does the level of GDP affect changes in wages and food prices? Or, if GDP increases more significantly in one year, will this be reflected in food prices or wages in the same or following year by a more significant increase?** 
 
According to the analysis, the level of GDP does not affect changes in wages and prices neither in the current nor in the following year.

### **Additional notes on table creation**

The **primary** table was created by joining the following tables: ***czechia_price, czechia_price_category, czechia_region, czechia_payroll, czechia_payroll_industry_branch***, using CTEs. When I was exploring tables I had found out that the data in the table ***czechia_price*** are for the period from 2006 to 2018, unlike the data in the table ***czechia_payroll*** are for the period 2000 to 2021. So, for comperison I chose the period from 2006 to 2018. Also I found out that in the table ***czechia_payroll*** we have data for *physical* and for *calculated* wages, so I sorted them by *calculated* wages. And data for *average number of employed persons* and *average wage per employee*, so I sorted them too by *average wage per employee* for correct outputs.

The **secondary** table was created based on the tables ***economies*** and ***countries*** for **Europe** and for the same time period (2006 - 2018).