DROP DATABASE IF EXISTS BikeSales_DW;
GO

CREATE DATABASE BikeSales_DW;
GO

USE BikeSales_DW;
GO

DROP TABLE IF EXISTS FactBikeSales,
					 DimCustomer,
                     DimProduct,
					 DimSalesRep,
                     DimDate;
GO


/* Create table DimDate */
print 'Create table: DimDate'

CREATE TABLE DimDate (
   [date_key]  int  NOT NULL,  
   [date] date   NOT NULL,  
   [year]  int   NOT NULL,
   [month]  int   NOT NULL,  
   [day]  int   NOT NULL, 
   PRIMARY KEY (date_key)
)
GO

/* Create table DimSalesRep*/
print 'Create table: DimStore'

CREATE TABLE DimSalesRep (
   salesrep_key  int  IDENTITY(1,1)	NOT NULL,
   sales_rep_name VARCHAR (255)	NOT NULL,
   store_name VARCHAR (255)	NOT NULL,
   PRIMARY KEY (salesrep_key)
);
GO

/* Create table DimProduct*/
print 'Create table: DimProduct'

CREATE TABLE DimProduct (
   product_key  int  IDENTITY(1,1)  NOT NULL,
   product_name VARCHAR (255) NOT NULL,
   category_name VARCHAR (255) NOT NULL,
   brand_name VARCHAR (255) NOT NULL,
   PRIMARY KEY (product_key)
);
GO

/* Create table DimProduct*/
print 'Create table: DimCustomer'

CREATE TABLE DimCustomer (
   customer_key  int  IDENTITY(1,1)  NOT NULL,
   full_name VARCHAR (255) NOT NULL,
   city VARCHAR (50) NOT NULL,
   state VARCHAR (5) NOT NULL,
   PRIMARY KEY (customer_key)
);
GO

/* Create table FactBikeSales */
print 'Create table: FactBikeSales'

CREATE TABLE FactBikeSales (
   [date_key]  int  NOT NULL,
   salesrep_key  int   NOT NULL,
   product_key  int   NOT NULL,
   customer_key int NOT NULL,
   order_id int NOT NULL,
   sales_volume INT NOT NULL,
   total_revenue DECIMAL (12, 2) NOT NULL,
   PRIMARY KEY (date_key, salesrep_key, product_key, customer_key),
   FOREIGN KEY (customer_key) REFERENCES DimCustomer (customer_key), 
   FOREIGN KEY (product_key) REFERENCES DimProduct (product_key), 
   FOREIGN KEY (salesrep_key) REFERENCES DimSalesRep (salesrep_key),
   FOREIGN KEY (date_key) REFERENCES DimDate (date_key)
);
GO
   