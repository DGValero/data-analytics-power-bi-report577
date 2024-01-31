# Data Analytics with Power BI 

In this project, I am analysing a medium-sized international retailer who is keen on elevating their business intelligence practices. With operations spanning across different regions, they have accumulated large amounts of sales from disparate sources over the years. Recognising the value of this data, they aim to transform it into actionable insights for better decision-making.

I used Microsoft Power BI to design a comprehensive quarterly report. This report presents a high-level business summary tailored for C-suite executives, and also gives insights into their highest value customers segmented by sales region, provide a detailed analysis of top-performing products categorised by type against their sales targets, and a visually appealing map visual that spotlights the performance metrics of their retail outlets across different territories.

## Tasks implemented

### Loading and transforming data

1. **Orders** Table: this is the main fact table. I imported this table from an Azure SQL Database using the appropriate credentials. Once I connected to the database, I transform the data in Power Query Editor deleting the *[Card Number]* column to ensure data privacy. I also split the *[Order Date]* column into two distinct columns each: one for the date and another for the time. As there were order rows with missing and null values, I removed these to maintain data integrity. Finally, I renamed the columns in the dataset to align with Power BI naming conventions.

2. **Products** Table: the data for this table was stored in a local .csv file that I imported to Power Query. 

3. **Stores** Table: the data for this table was stored in .csv format in an Azure Blob Storage. I connected to the blob storage using the appropriate credentials and renamed the columns to ensure clarity and consistency in my report.

4. **Customers** Table: this data was provided as a .zip file. Inside the zip file is a folder containing three CSV files, each with the same column format, one for each of the regions in which the company operates. Using the *Folder data connector* in Power BI, I loaded this data, removed unused columns and renamed remaining columns as required.

### Data modelling

1. **Dates Table**: In order to make use of Power BI's time intelligence functions, I made a continuous date table, covering the entire time period of the data, using DAX. I also added extra columns such as 'Start of the Year' or 'Quarter' to allow me to customise the visuals and measures later on.
![Dates Table](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/1%20-%20Dates%20Table.png?raw=true)

2. **Star Schema Data Model**: next, I established relationships between key tables, building a star-based schema with one-to-many relationships and a single filter direction.
![Star schema](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/2%20-%20Star%20schema.png?raw=true)

3. **Create key Measures**: using DAX, I created key measures that will be used in the report. More measures will be created as I developed the project. Some examples include: 'Total orders', 'Total revenue', and quarter-based performance indicators.
![Key measures](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/3%20-%20Measures.png?raw=true)

4. **Hierarchies**: to aid in granular and high-level explorations, I created two hierarchies: one for dates, to facilitate drill-down in the line charts; and one for geography, to allow filtering data by region, country and province/state. 

    ![Date hierarchy](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/4%20-%20Date%20hierarchy.png?raw=true)

### Building the Customer Detail Page

I created a report page focusing on customer-level analysis. In this page, I set up the following visuals:
- Card Visuals for total distinct customers and revenue per customer.
- A line chart of weekly distinct customers.
- A table showing the top 20 customers by total revenue, and a bar chart showing number of customers by product category.
- A set of three card visuals showing the name, number of orders, and revenue for the top customer by revenue.
- A date slicer.

A screenshot of the finished page is shown below:
![Customer Detail page](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/5%20-%20Customer%20Detail%20page.png?raw=true)

### Building the Executive Summary Page

I also created a report page for the high-level executive summary. The purpose of this page is to give an overview of the company's performance as a whole, so that C-suite executives can quickly get insights and check outcomes against key targets.
This page contains the following visuals:
- Card visuals showing Total revenue, Total profit and Total orders.
- A graph of revenue against time.
- Donut charts showing orders and revenue by country.
- A bar chard of orders by category.
- KPIs for Quarterly revenue, customers and profit.
- A table of the top 10 products.

A screenshot of the finished page is shown below:
![Executive Summary page](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/6%20-%20Executive%20summary.png?raw=true)

To create the table showing only the top 10 products I used the filter functionality in PowerBI:
![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/6.1%20-%20Filtering%20top%20products.png?raw=true)

Then I applied conditional formatting to the Total Revenue column to show bars indicating the % revenue value:
![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/6.2%20Conditional%20formatting%20on%20table.png?raw=true)

To create the KPI visuals I needed to create new measures in DAX: Previous quarter revenue, Previous quarter Profit and Previous Quarter Orders:
![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/6.3%20DAX%20for%20previous%20quarter.png?raw=true)

I also created Target goal measures that are a 5% increase of the previous quarter:
![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/6.4%20DAX%20Target%20revenue.png?raw=true)

With these measures I was able to create my KPI figures:
![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/6.5%20KPI%20visual.png?raw=true)

### Building the Product Detail Page

The purpose of this page is providing an in-depth look at which products within the inventory are performing well, with the option to filter by product and region.

To achieve this, you I built a report page that provides insights for all products and regions combined. 

Additionally, to allow the users of the report filter data easily, I created a pop-up banner using bookmarks add a slicer toolbar which can be accessed from the navigation pane. A screenshot of the custom filter toolbar I created is shown below:
![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/7.1%20Product%20detail.png?raw=true)

The Product Detail page I created contains the following visuals:
- Card visuals to show which filters are currently selected.
- Gauge visuals to show how the selected category's revenue, profit and number of orders are performing against a quarterly target.
- An area chart showing relative revenue performance of each category over time.
- A table showing the top 10 products by revenue in the selected context.
- A scatter graph of quantity ordered against profit per item for products in the current context.

A screenshot of the finished page is shown below:
![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/7%20-%20Product%20detail.png?raw=true)

### Building a Stores Map Page

This page allows the regional managers to easily check on the stores under their control, allowing them to see which of the stores are most profitable, as well as which ones are on track to reach their quarterly profit and revenue targets.

The best way to handle this is using a map visual.
![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/8.%20Stores%20map.png?raw=true)

#### Drillthrough page

I also created a drillthrough page that summarises each store's performance. I built this page to make it easy for the region managers to check on the progress of a given store. 

Right-click on a given store then click:
![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/8.1%20Drillthrough.png?raw=true)

Drillthrough page for the Hamburg store:
![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/8.2%20Drillthrough%20page.png?raw=true)

#### Tooltip page

I wanted users to be able to see each store's year-to-date profit performance against the profit target just by hovering the mouse over a store on the map. To do this, I created a custom tooltip page with a profit gauge visual, and then set the tooltip of the visual to the tooltip page I have created. See example below:

![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/8.3%20Tooltip.png?raw=true)

### Cross-filtering and navigation

The PowerBI report was fully functional at this point but there were a few details left to add. 

PowerBI has cross-filtering of visuals enabled by default. This means that clicking on a visual will automatically filter the others. This can be beneficial in some situation but can also become confusing. I reviewed the cross-filtering of all visuals to ensure the report is used as intended.

I also added custom navigation buttons with links to each page of the PowerBI report. These buttons would be highlighted when hovering over them.

![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/9.%20Navigation.png?raw=true)
![Alt text](https://github.com/DGValero/data-analytics-power-bi-report577/blob/main/Screenshots/9.1%20Navigation.png?raw=true)

## Creating metrics for outside users using SQL

In case some clients do not have access to visualisation tools such as PowerBI, I also extracted insights from the data using SQL. This would allow me to extract and disseminate key data without solely relying on visualisation tools.

Using Visual Studio Code and the `SQLTools` extension, I created a connection to the Postgres database server hosted on Microsoft Azure.

Once I stablished the connection, I explored the contents of the database tables, columns and data.

As an example, I identified the following questions and created `SQL` queries to come up with the answer.

1. How many staff are there in all of the UK stores?

2. Which month in 2022 has had the highest revenue?

3. Which German store type had the highest revenue for 2022?

4. Create a view where the rows are the store types and the columns are the total sales, percentage of total sales and the count of orders

5. Which product category generated the most profit for the "Wiltshire, UK" region in 2021?

I saved these SQL queries in the *SQL queries* folder in GitHub, as well as the output in .csv format.