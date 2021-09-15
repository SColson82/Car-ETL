**Car ETL Report**

**Summary:** This project utilized four sources of data to analyze information about characteristics of automobiles and the car buying process. This database could be useful in the car buying and selling process for both dealerships and private consumers.

**Extract:**

We pulled files from the following sources:

- Kaggle Used Cars Dataset:
  - [https://www.kaggle.com/doaaalsenani/usa-cers-dataset](https://www.kaggle.com/doaaalsenani/usa-cers-dataset)
  - This dataset includes information about used car purchases including price, make, model, mileage, color, and location. Extraneous columns were dropped, and the color column was cleaned (variations of the same color were combined-- i.e. &quot;white,&quot; &quot;pure white,&quot; and &quot;polar white&quot; were combined). Only cars located in the USA were kept in the dataset.

- Fuel Economy:
  - [https://www.fueleconomy.gov/feg/download.shtml](https://www.fueleconomy.gov/feg/download.shtml)
  - This dataset contains fuel economy data resulting from vehicle testing done at the Environmental Protection Agency&#39;s (EPA) National Vehicle and Fuel Emissions Laboratory. The initial vehicle data collected contained 83 different columns for MPG estimates for all 1984-2021 model year vehicles. From there the year, make, model, city MPG, highway MPG, combo MPG, fuel type, annual fuel cost, vehicle class size, number of engine cylinders, transmission type and drive axle type were extracted and all the other columns were dropped. We renamed the headers for each column to better classify our information and to make it easier to merge. From there, we exported the cleaned data into a CSV.
  - Once pulled into the merged\_auto data, the data was sorted by year and cleaned once again by dropping &quot;4WD&quot; and &quot;2WD&quot; off of certain car models to allow for an easier merge.

- Autolist Scraped Data:
  - [https://www.autolist.com](https://www.kbb.com/cars-for-sale/vehicledetails.xhtml?listingId=601035166&amp;zip=38556&amp;clicktype=elot)
  - This dataset consists of vehicle information scraped from the above website including make, model, year, vin, color, price, mileage, condition, dealer name, etc. Once the data was collected it was read into CSV format, then Pandas Dataframe. At that time it was compared to the Kaggle Dataset and manipulated to coalesce both datasets into one. Dollar signs, decimals, and commas were removed. Data Types were reset as int, the states were formatted to match across the total dataset and these were compared to the fuel economy dataset to ensure that the possibility of merging all for further manipulation was maximized.

- Car Dealership Customer Information:
  - [https://www.kaggle.com/vikaspericherla/automobile-customer-multiclassification](https://www.kaggle.com/vikaspericherla/automobile-customer-multiclassification)
  - This dataset was obtained from kaggle.com, and it contains customer information collected by car retailers. The dataset includes Customer ID, Age, Income Bracket (Low, Medium, High), Gender, State, Region, Marital Status, Number of Children, Occupation, Vehicle Segment, Number of Months Owning Current Car, Number of Current Offers on Call. In all, 10732 customers are included in the dataset. Cleaning the data required the removal of rows containing null values as well as removing extra characters from some data fields (e.g. &#39;Urban#&#39; instead of &#39;Urban&#39;).

**Transform:**

We started our transformation by analyzing our files and narrowing to useful information. We filtered and dropped unwanted columns and null values from the data to narrow our dataset to pertinent columns from which to perform our analysis. Kaggle USA Cars and the Autolist scraped data set were combined to create a single table, then fuel kaggle and customer data were also cleaned and left as their own tables.

**Load:**

Our final data frames are housed in a relational database in pgAdmin that will support the column and row structure of our dataframes. The final dataframes will include information gleaned during the transform phase of the project.



  **Example Use Cases:**

SCENARIO 1: Promote Value-Priced used cars with less than 150,000 miles to low-income parents of two or more children.

1. SQL Query for cars:

**select** distinct vin, make, model, price, year, mileage

**from** auto\_list\_data

**where** price \&lt;= 20000

and mileage \&lt;=150000

**order** by price desc

1. SQL Query for the customers:

**select** distinct `Customer ID`, No\_of\_children, Income

**from** customer\_data

**where** No\_of\_children \&gt;=2

and Income = 1

**order** by No\_of\_children

SCENARIO 2: Promote High MPG Vehicles to white-collar professionals living in suburban areas

1. SQL Query for Cars:

**select** distinct Year, Make, Model, `Combined MPG`

**from** fuel\_economy\_data

**where** `Combined MPG` \&gt;= 30

**order** by `Combined MPG` DESC

1. SQL Query for the customers:

**select** distinct `Customer ID`, Occupation, Region

**from** customer\_data

**where** Region = &#39;Sub-urban&#39;

and Occupation = &#39;White Collar Clerical&#39;

**order by** `Customer ID`
