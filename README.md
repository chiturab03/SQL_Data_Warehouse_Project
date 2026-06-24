# SQL Data Warehouse & Analytics

Welcome to my SQL Data Warehouse and Analytics Project repository.

A portfolio project demonstrating an end-to-end data warehouse and analytics solution built with SQL Server and Power BI. The project covers the full lifecycle
from raw data ingestion through to business insight generation — and reflects industry best practices in data engineering, dimensional modeling, ETL development, 
and business intelligence.

---

# Project Overview

This project consolidates sales data from two separate source systems an ERP system and a CRM system into a single, analytics-ready SQL Server data warehouse. 
The warehouse is designed to support reporting, trend analysis, and data-driven business decision-making.

Key focus areas:
1. Data ingestion and transformation
2. Data warehouse design
3. ETL development using T-SQL
4. Dimensional modeling (facts and dimensions)
5. Business intelligence with Power BI

---

# Architecture
The warehouse follows the Medallion Architecture, organising data into three progressive layers:

---

## Architecture

The warehouse follows the **Medallion Architecture**, organising data into three progressive layers:

| Layer | Purpose |
|-------|---------|
| **Bronze** | Raw data ingested directly from source systems with no transformation |
| **Silver** | Cleaned, standardised, and validated data ready for integration |
| **Gold** | Business-friendly dimensional model optimised for analytical queries |

---

## ETL Pipeline

The ETL process is implemented entirely in T-SQL and handles the end-to-end movement and transformation of data from source to warehouse.

**Steps:**

1. **Database setup** — Create the `DATAWAREHOUSE` database and define schemas for each Medallion layer
2. **Table creation** — Define staging, integration, and dimensional tables
3. **Data ingestion** — Import raw ERP and CRM data from CSV source files
4. **Data cleansing** — Standardise formats, resolve inconsistencies, and handle missing values
5. **Data quality checks** — Identify and resolve duplicates, nulls, and referential integrity issues
6. **Integration** — Merge ERP and CRM records into a unified, conformed data model

---

## Data Modeling

The Gold layer implements a **dimensional model** (star schema) designed for analytical workloads:

- **Fact tables** capture measurable business events (e.g. sales transactions)
- **Dimension tables** provide descriptive context (e.g. customers, products, dates)

This structure optimises query performance and makes the data accessible to business users and BI tools without requiring deep SQL knowledge.

---

## Analytics & Reporting

SQL queries and Power BI dashboards provide actionable insight across three core analysis areas:

### Customer Behaviour
- Customer segmentation
- Purchasing patterns and frequency
- Repeat customer analysis
- High-value customer identification

### Product Performance
- Best-selling products
- Category-level performance
- Revenue and profitability by product
- Underperforming product identification

### Sales Trends
- Sales growth over time
- Monthly and yearly trend analysis
- Regional and channel performance
- Seasonal patterns and business cycles

**Deliverables:**
- Analytical SQL queries
- Power BI dashboards and visualisations
- KPI tracking and business metrics
- Paginated reports via Power BI Report Builder

---

## Tech Stack

| Tool | Use |
|------|-----|
| SQL Server | Data warehouse platform |
| T-SQL | ETL development, data modeling, analytical queries |
| Power BI Desktop | Interactive dashboards and visualisations |
| Power BI Report Builder | Paginated operational reports |

---

## Scope & Constraints

- The warehouse loads and maintains only the **most recent dataset**
- **Historical tracking** and **slowly changing dimensions (SCDs)** are outside the scope of this project

---

## Licence

This project is licenced under the [MIT Licence](LICENSE). You are free to use, modify, and distribute it with appropriate attribution.
