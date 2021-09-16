Select * From auto_list_data

Select * From customer_data

Select * From fuel_economy_data

Select distinct vin, make, model, price, year, mileage
From auto_list_data
Where price <= 20000
And mileage <= 150000
Order By price desc

Select id, children, income
From customer_data
Where children>=2
And income=1
Order By children

Select distinct year, make, model, combined_mpg
From fuel_economy_data
Where combined_mpg >= 30
Order By combined_mpg DESC

Select distinct id, occupation, region
From customer_data
Where region = 'Sub-urban'
And occupation ='White Collar Clerical'


