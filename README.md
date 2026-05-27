# 🛍️ Nykaa Marketing Campaign Performance Analysis
 
---
 
## 📌 Project Overview
 
This is an end-to-end data analytics project analysing Nykaa's marketing campaign performance across multiple customer segments and campaign types. The goal was to uncover actionable insights from raw campaign data — covering the full analyst workflow from data cleaning to interactive dashboard.
 
> **Note:** This project was built as part of my career transition into Data Analytics. It demonstrates my ability to work across the full data pipeline — from raw data to business insights.
 
---
 
## 🎯 Problem Statement
 
Nykaa runs marketing campaigns across 5 different channels targeting multiple customer segments. The business needed answers to:
 
- Which campaign type generates the highest revenue and ROI?
- Which customer segment is most valuable?
- Where in the funnel are users dropping off?
- What is the best campaign strategy for each customer segment?
- What is the cost efficiency of each campaign?
---
 
## 🔄 End-to-End Workflow
 
```
Raw Data (MySQL Database)
        ↓
Step 1: Data Cleaning (Microsoft Excel)
        ↓
Step 2: Data Analysis (MySQL — SQL Queries)
        ↓
Step 3: Data Visualisation (Power BI Dashboard)
        ↓
Step 4: Insights & Business Recommendations
```
 
---
 
## 🛠️ Tools Used
 
| Tool | Purpose |
|---|---|
| **MySQL** | Database storage, querying, aggregation |
| **Microsoft Excel** | Data cleaning — removed duplicates, fixed formatting & column types |
| **Power BI** | DAX measures, interactive dashboard, slicers, heatmap |
 
---
 
## 🧹 Step 1: Data Cleaning (Excel)
 
Before loading data into MySQL, the raw dataset was cleaned in Microsoft Excel:
 
- ✅ Removed duplicate rows to ensure data accuracy
- ✅ Removed blank/null rows across all columns
- ✅ Fixed column formatting — standardised date formats, currency, and text casing
- ✅ Corrected column data types — ensured numeric columns had no text mixed in
- ✅ Renamed columns for consistency before importing into MySQL
---
 
## 🗄️ Step 2: SQL Analysis (MySQL)
 
### Database Setup
```sql
USE nykaa_project;
```
 
### KPI Queries
 
**Total Acquisition Cost**
```sql
SELECT
    ROUND(SUM(Acquisition_Cost), 2) AS total_cost
FROM nykaa_campaign_data_analysis;
```
 
**Total Revenue**
```sql
SELECT
    SUM(Revenue) AS total_revenue
FROM nykaa_campaign_data_analysis;
```
 
**Average ROI**
```sql
SELECT
    ROUND(AVG(ROI), 2) AS avg_roi
FROM nykaa_campaign_data_analysis;
```
 
**Total Conversions**
```sql
SELECT
    SUM(Conversions) AS total_conversion
FROM nykaa_campaign_data_analysis;
```
 
**Cost Per Conversion**
```sql
SELECT
    ROUND(SUM(Acquisition_Cost) / SUM(Conversions), 2) AS cost_per_conversion
FROM nykaa_campaign_data_analysis;
```
 
### Segment & Campaign Analysis
 
**Best Customer Segment**
```sql
SELECT
    Customer_segment,
    SUM(Revenue) AS total_revenue,
    ROUND(AVG(ROI), 2) AS avg_roi,
    SUM(Conversions) AS total_conversion
FROM nykaa_campaign_data_analysis
GROUP BY Customer_segment
ORDER BY total_revenue DESC;
```
 
**Best Campaign Type**
```sql
SELECT
    Campaign_Type,
    SUM(Revenue) AS total_revenue,
    ROUND(AVG(ROI), 2) AS avg_roi,
    SUM(Conversions) AS total_conversion
FROM nykaa_campaign_data_analysis
GROUP BY Campaign_Type
ORDER BY total_revenue DESC;
```
 
**Best Campaign for Each Customer Segment**
```sql
SELECT
    Customer_segment,
    Campaign_Type,
    SUM(Revenue) AS revenue,
    ROUND(AVG(ROI), 2) AS roi
FROM nykaa_campaign_data_analysis
GROUP BY Customer_segment, Campaign_Type
ORDER BY Customer_segment, revenue DESC;
```
 
**Funnel Performance**
```sql
SELECT
    Campaign_Type,
    SUM(Impressions) AS impressions,
    SUM(Clicks) AS clicks,
    SUM(Leads) AS leads,
    SUM(Conversions) AS conversion,
    ROUND(SUM(Clicks) * 100.0 / SUM(Impressions), 2) AS CTR,
    ROUND(SUM(Leads) * 100.0 / SUM(Clicks), 2) AS Lead_Rate,
    ROUND(SUM(Conversions) * 100.0 / SUM(Leads), 2) AS Conversion_Rate
FROM nykaa_campaign_data_analysis
GROUP BY Campaign_Type;
```
 
---
 
## 📊 Step 3: Power BI Dashboard
 
### DAX Measures Created
 
```
Total Revenue = SUM(raw_data[Revenue])
Total Acquisition Cost = ROUND(SUM(raw_data[Acquisition_Cost]), 2)
Avg ROI = ROUND(AVERAGE(raw_data[ROI]), 2)
Total Conversions = SUM(raw_data[Conversions])
Cost Per Conversion = ROUND(DIVIDE(SUM(raw_data[Acquisition_Cost]), SUM(raw_data[Conversions])), 2)
CTR% = ROUND(DIVIDE(SUM(raw_data[Clicks]), SUM(raw_data[Impressions])) * 100, 2)
Lead Rate% = ROUND(DIVIDE(SUM(raw_data[Leads]), SUM(raw_data[Clicks])) * 100, 2)
Conversion Rate% = ROUND(DIVIDE(SUM(raw_data[Conversions]), SUM(raw_data[Leads])) * 100, 2)
```
 
### Dashboard Visuals
 
| Visual | Purpose |
|---|---|
| 5 KPI Cards | Total Revenue, Acquisition Cost, ROI, Conversions, Cost Per Conversion |
| Horizontal Bar Chart | Revenue by Customer Segment |
| Horizontal Bar Chart | Revenue by Campaign Type |
| Clustered Column Chart | CTR% / Lead Rate% / Conversion Rate% by Campaign |
| Funnel Chart | Campaign Funnel — Impressions → Clicks → Leads → Conversions |
| Matrix Heatmap | Best Campaign per Customer Segment |
| 2 Slicers | Dynamic filtering by Campaign Type & Customer Segment |
 
### Dashboard Screenshot
 
![Nykaa Dashboard](/dashboard.png)
 
---
 
## 💡 Step 4: Key Insights
 
| # | Insight | Business Impact |
|---|---|---|
| 1 | **Working Women** is the highest revenue segment at ₹5,812M | Prioritise this segment in future campaign budgets |
| 2 | **Influencer campaigns** deliver the best ROI across all types | Increase influencer marketing investment |
| 3 | Only **9% of impressions convert to clicks** | Ad creatives need optimisation to improve CTR |
| 4 | **55% lead-to-conversion rate** — strong bottom-of-funnel | Checkout and sales process is performing well |
| 5 | **Paid Ads + Tier 2 City Customers** shows high revenue potential | Expand Tier 2 targeting via Paid Ads |
