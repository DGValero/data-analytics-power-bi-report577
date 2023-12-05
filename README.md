# Data Analytics with Power BI 

In this project, I am analising a medium-sized international retailer who is keen on elevating their business intelligence practices. With operations spanning across different regions, they have accumulated large amounts of sales from disparate sources over the years. Recognising the value of this data, they aim to transform it into actionable insights for better decision-making.

I used Microsoft Power BI to design a compreshensive Quaterly report. This report presents a high-level business summary tailored for C-suite executives, and also gives insights into their highest value customers segmented by sales region, provide a detailed analysis of top-performing products categorised by type against their sales targets, and a visually appealing map visual that spotlights the performance metrics of their retail outlets across different territories.

## Tasks implemented

### Loading and tranforming data

1. **Orders** Table: this is the main fact table. I imported this table from an Azure SQL Database using the appropiate credentials. Once I connected to the database, I transform the data in Power Query Editor deleting the *[Card Number]* column to ensure data privacy. I also split the *[Order Date]* column into two distinct columns each: one for the date and another for the time. As there were order rows with missing and null values, I removed these to maintain data integrity. Finally, I renamed the columns in the dataset to align with Power BI naming conventions.

2. **Products** Table: the data for this table was stored in a local .csv file that I imported to Power Query. 

3. **Stores** Table: the data for this table was stored in .csv format in an Azure Blob Storage. I connected to the blob storage using the appropiate credentials and renamed the columns to ensure clarity and consistency in my report.

4. **Customers** Table: this data was provided as a .zip file. Inside the zip file is a folder containing three CSV files, each with the same column format, one for each of the regions in which the company operates. Using the *Folder data connector* in Power BI, I loaded this data, removed unused columns and renamed remaining columns as required.

### Data modelling

1. **Dates Table**: In order to make use of Power BI's time intelligence functions, I made a continuous date table, covering the entire time period of the data, using DAX. I also added extra columns such as 'Start of the Year' or 'Quarter' to allow me to customise the visuals and measures later on.
![Dates Table](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/1%20-%20Dates%20Table.png?raw=true)

2. **Star Schema Data Model**: next, I established relationships between key tables, building a star-based schema with one-to-many relationships and a single filter direction.
![Alt text](<screenshots/2 - Star schema.png>)

3. **Create key Measures**: using DAX, I created key measures that will be used in the report. More measures will be created as I developed the project. Some examples include: 'Total orders', 'Total revenue', and quarter-based performance indicators.
![Alt text](<screenshots/3 - Measures.png>)

4. **Hierarchies**: to aid in granular and high-level explorations, I created two hierarchies: one for dates, to facilitate drill-down in the line charts; and one for geography, to allow filtering data by region, country and province/state. 

    ![Alt text](<screenshots/4 - Date hierarchy.png>)

### Building the Customer Detail Page

I created a report page focusing on customer-level analysis. In this page, I set up the following visuals:
- Card Visuals for total distinct customers and revenue per customer
- A line chart of weekly distinct customers
- A table showing the top 20 customers by total revenue, and a bar chart showing number of customers by product category
- A set of three card visuals showing the name, number of orders, and revenue for the top customer by revenue
- A date slicer

A screenshot of the finished page is shown below:
![Customer Detail page](<screenshots/5 - Customer Detail page.png>)

### Building the Executive Summary Page

I also created a report page for the high-level executive summary. The purpose of this page is to give an overview of the company's performance as a whole, so that C-suite executivves can quickly get insights and check outcomes against key targets.
This page contains the following visuals:
- Card visuals showing Total revenue, Total profit and Total orders
- A graph of revenue against time
- Donut charts showing orders and revenue by country
- A bar chard of orders by category
- KPIs for Quarterly revenue, customers and profit
- A table of the top 10 products

A screenshot of the finished page is shown below:
![Executive Summary page](<screenshots/6 - Executive summary.png>)

To create the table showing only the top 10 products I used the filter functionality in PowerBI:
![Alt text](<screenshots/6.1 - Filtering top products.png>)

Then I applied conditional formatting to the Total Revenue column to show bars indicating the % revenue value:
![Alt text](<screenshots/6.2 Conditional formatting on table.png>)

To create the KPI visuals I needed to create new measures in DAX: Previous quarter revenue, Previous quarter Profit and Previous Quarter Orders:
![Alt text](<screenshots/6.3 DAX for previous quarter.png>)

I also created Target goal measures that are a 5% increase of the previous quarter:
![Alt text](<screenshots/6.4 DAX Target revenue.png>)

With these measures I was able to create my KPI figures:
![Alt text](<screenshots/6.5 KPI visual.png>)