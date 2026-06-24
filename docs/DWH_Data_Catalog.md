# Data Dictionary for Gold Layer

\---

# Overview

The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. 

It consist of dimension tables and fact tables for specific business metrics



\---



1. gold.dim\_customers
Purpose: Stores customers details enriched with demographic and geographic data. 
Columns:



|Column Name|Data Type|Description|
|-|-|-|
|customer\_key|INT|Surrogate key uniquely identifying each customer record in the dimension table.|
|Customer\_id|INT|Unique numerical identifier assigned to each customer.|
|Customer\_number|NVARCHAR(50)|Alphanumerical identifier representing the customer, used for tracking and referencing|
|first\_name|NVARCHAR(50)|Customer's first name as recorded in the system.|
|last\_name|NVARCHAR(50)|Customer's last name or family name.|
|country|NVARCHAR(50)|Country of residence for the customer (e.g.,'Australia')|
|marital\_status|NVARCHAR(50)|Marital status of the customer (e.g.,'Married'/'Single')|
|gender|NVARCHAR(50)|The gender of the customer, (e.g.,'Female'/'Male')|
|birthdate|DATE|Date of birth of the customer (e.g.,'Australia')formatted as YYYY-MM-DD (e.g.,1971-10-06)|
|create\_date|DATE|The date and time when the customer record was created in the system|



2\. gold.dim\_products

* Purpose: Provides information about the products and h=their attributes.
* Columns:





|Column Name|Data Type|Description|
|-|-|-|
|product\_key|INT|Surrogate key uniquely identifying each product record in the product dimension table.|
|product\_id|INT|A unique identifier assigned to the product for internal tracking and referencing.|
|product\_number|NVARCHAR(50)|A structure alphanumeric code representing the product, often used for categorisation or inventory.|
|product\_name|NVARCHAR(50)|Descriptive name of the product, including key details such as type, colour and size.|
|category\_id|NVARCHAR(50)|A unique identifier for the product's category, linking to its high level classification.|
|category|NVARCHAR(50)|Broader classification of the product(e.g., Bike Components)|
|subcategory|NVARCHAR(50)|More detailed classification of the product within the category (e.g. product type)|
|maintenance\_required|NVARCHAR(50)|Indicates whether the product requires maintenance(e.g.,'Yes','No')|
|cost|INT|The cost or base price of the product, measures in monetary units.|
|product\_line|NVARCHAR(50)|The specific product line or series to which the product belongs(e.g., Road, Mountain)|
|start\_date|DATE|Date when the product became available for sale or use, stored in|



3\. gold.fact\_sales

* Purpose: Stores transactional sales data for analytical purposes.
* Columns:





|Column Name|Data Type|Description|
|-|-|-|
|order\_number|NVARCHAR(50)|A unique alphanumeric identifier for each sales order (e.g., 'SO54496')|
|product\_key|INT|Surrogate key linking the order to the product dimension table.|
|customer\_key|INT|Surrogate key linking the order to the customer dimension table.|
|order\_date|DATE|The date when the order was placed.|
|ship\_date|DATE|The date when the order was shipped to the customer.|
|due\_date|DATE|The date when the order payment was due.|
|sales\_amount|INT|The total monetary value of the sale for the line item, in whole currency units (e.g,25).|
|quantity|INT|The number of units of the product ordered for the line item(e.g.,1)|
|price|INT|The price per unit of the product for the item, in whole currency units (e.g.,25)|







































