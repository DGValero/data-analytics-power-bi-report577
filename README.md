# Data Analytics with Power BI 

In this project, I am analising a medium-sized international retailer who is keen on elevating their business intelligence practices. With operations spanning across different regions, they have accumulated large amounts of sales from disparate sources over the years. Recognising the value of this data, they aim to transform it into actionable insights for better decision-making.

I used Microsoft Power BI to design a compreshensive Quaterly report. This report presents a high-level business summary tailored for C-suite executives, and also gives insights into their highest value customers segmented by sales region, provide a detailed analysis of top-performing products categorised by type against their sales targets, and a visually appealing map visual that spotlights the performance metrics of their retail outlets across different territories.

## Tasks implemented

### Loading and tranforming data

1. **Orders** Table: this is the main fact table. I imported this table from an Azure SQL Database using the appropiate credentials. Once I connected to the database, I transform the data in Power Query Editor deleting the *[Card Number]* column to ensure data privacy. I also split the *[Order Date]* column into two distinct columns each: one for the date and another for the time. As there were order rows with missing and null values, I removed these to maintain data integrity. Finally, I renamed the columns in the dataset to align with Power BI naming conventions.

2. **Products** Table: the data for this table was stored in a local .csv file that I imported to Power Query. 

3. **Stores** Table: the data for this table was stored in .csv format in an Azure Blob Storage. I connected to the blob storage using the appropiate credentials and renamed the columns to ensure clarity and consistency in my report.

4. **Customers** Table: this data was provided as a .zip file. Inside the zip file is a folder containing three CSV files, each with the same column format, one for each of the regions in which the company operates. Using the *Folder data connector* in Power BI, I loaded this data, removed unused columns and renamed remaining columns as required.