# **Car ETL Report**

**Summary:** This project utilized four sources of data to analyze information about characteristics of automobiles and the car buying process. This database could be useful in the car buying and selling process for both dealerships and private consumers.

## **Extract:**

We pulled files from the following sources:
<br>
<br>

- Kaggle Used Cars Dataset:
  - [https://www.kaggle.com/doaaalsenani/usa-cers-dataset](https://www.kaggle.com/doaaalsenani/usa-cers-dataset)
  - This dataset includes information about used car purchases including price, make, model, mileage, color, and location. Extraneous columns were dropped, and the color column was cleaned (variations of the same color were combined-- i.e. &quot;white,&quot; &quot;pure white,&quot; and &quot;polar white&quot; were combined). Only cars located in the USA were kept in the dataset.
<br>
<br>

- Fuel Economy:
  - [https://www.fueleconomy.gov/feg/download.shtml](https://www.fueleconomy.gov/feg/download.shtml)
  - This dataset contains fuel economy data resulting from vehicle testing done at the Environmental Protection Agency&#39;s (EPA) National Vehicle and Fuel Emissions Laboratory. The initial vehicle data collected contained 83 different columns for MPG estimates for all 1984-2021 model year vehicles. From there the year, make, model, city MPG, highway MPG, combo MPG, fuel type, annual fuel cost, vehicle class size, number of engine cylinders, transmission type and drive axle type were extracted and all the other columns were dropped. We renamed the headers for each column to better classify our information and to make it easier to merge. From there, we exported the cleaned data into a CSV.
  - Once pulled into the merged\_auto data, the data was sorted by year and cleaned once again by dropping &quot;4WD&quot; and &quot;2WD&quot; off of certain car models to allow for an easier merge.
<br>
<br>

- Autolist Scraped Data:
  - [https://www.autolist.com](https://www.autolist.com/search?location=location=Atlanta,%20GA&latitude=33.7489954&longitude=-84.3879824&radius=50&page=)
  - This dataset consists of realtime vehicle information scraped from the above website including make, model, year, vin, color, price, mileage, condition, dealer name, etc. Once the data was collected it was read into CSV format, then Pandas Dataframe. At that time it was compared to the Kaggle Dataset and manipulated to coalesce both datasets into one. Dollar signs, decimals, and commas were removed. Data Types were reset as int, the states were formatted to match across the total dataset and these were compared to the fuel economy dataset to ensure that the possibility of merging all for further manipulation was maximized. In total, over 6,000 New and Used vehicles have been listed. 
<br>
<br>

- Car Dealership Customer Information:
  - [https://www.kaggle.com/vikaspericherla/automobile-customer-multiclassification](https://www.kaggle.com/vikaspericherla/automobile-customer-multiclassification)
  - This dataset was obtained from kaggle.com, and it contains customer information collected by car retailers. The dataset includes Customer ID, Age, Income Bracket (Low, Medium, High), Gender, State, Region, Marital Status, Number of Children, Occupation, Vehicle Segment, Number of Months Owning Current Car, Number of Current Offers on Call. In all, 10732 customers are included in the dataset. Cleaning the data required the removal of rows containing null values as well as removing extra characters from some data fields (e.g. &#39;Urban#&#39; instead of &#39;Urban&#39;).

## **Transform:**

We started our transformation by analyzing our files and narrowing to useful information. We filtered and dropped unwanted columns and null values from the data to narrow our dataset to pertinent columns from which to perform our analysis. Kaggle USA Cars and the Autolist scraped data set were combined to create a single table, then fuel kaggle and customer data were also cleaned and left as their own tables.

### **Fuel Economy Original Dataset:**

![image](https://user-images.githubusercontent.com/83737584/133689144-642cb8d8-046f-4223-8c32-5bc9988f17e4.png)

### **Fuel Economy Cleaned Dataset:**

![image](https://user-images.githubusercontent.com/83737584/133689225-5fd50e96-f8e9-4141-a53b-294ade00de13.png)

<br>

## **Load:**

Our final data frames are housed in a relational database in pgAdmin that will support the column and row structure of our dataframes. The final dataframes will include information gleaned during the transform phase of the project.



<br>

### **Example Use Cases:**

### SCENARIO 1: Promote Value-Priced used cars with less than 150,000 miles to low-income parents of two or more children.
<br>

* SQL Query for cars:

![image](https://user-images.githubusercontent.com/83737584/133689637-c50fed5e-966e-44a7-ab87-61388e267a94.png)

<br>
<br>

* SQL Query for the customers:

![image](https://user-images.githubusercontent.com/83737584/133691562-e5ffe2ff-c911-4a99-8572-32a2bfdcd126.png)

<br>
<br>

### SCENARIO 2: Promote High MPG Vehicles to white-collar professionals living in suburban areas
<br>

* SQL Query for Cars:

![image](https://user-images.githubusercontent.com/83737584/133689706-2417f291-bbfc-497c-a27f-9943aaac0ca0.png)

<br>

* SQL Query for the customers:

![image](https://user-images.githubusercontent.com/83737584/133691601-bebc501c-c03f-48a0-9cad-0235fddeb37c.png)

## Conclusions:

The databases that were created from the above extraction, transformation, and loading process can be useful in many different ways from a business perspective. For example, these may be used to create customized marketing lists as indicated in the code above, or it could be used as a training and enhancement tool for salesteams in each location of a national chain. With these databases, a sales person could take information based on the customer's needs (ie. the customer dataset provided) and return them a list of vehicles that might interest the customer. Future improvements could include adding information from more vehicle sales sources through automated API calls and webscraping. Additionally, this could be set up as a questionaire in which the salesman or customer (say from their smart phone on Tuesday) could enter the parameters they may be looking for and when the customer arrives on Saturday the salesperson can have the five top vehicles that fit the customer's needs and desires available for their inspection. 
