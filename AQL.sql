USE nykaa_project;

SELECT * FROM nykaa_campaign_data_analysis;

SELECT * FROM nykaa_channel_data;

-- Total Acquisition Cost

SELECT
    ROUND(SUM(Acquisition_Cost),2) AS total_cost
FROM nykaa_campaign_data_analysis;


-- Total revenue

SELECT 
SUM(Revenue) AS total_revenue
FROM nykaa_campaign_data_analysis;

-- AVG ROI

SELECT
ROUND(AVG(ROI),2) AS avg_roi
FROM nykaa_campaign_data_analysis;

-- Total conversion

SELECT
SUM(Conversions) AS total_conversion
FROM nykaa_campaign_data_analysis;

-- Cost Per Conversion

SELECT
    ROUND(SUM(Acquisition_Cost) / SUM(Conversions),2) AS cost_per_conversion
FROM nykaa_campaign_data_analysis;

-- Best customer segment

SELECT 
Customer_segment,
SUM(Revenue) AS total_revenue,
ROUND(AVG(ROI),2) AS avg_roi,
SUM(Conversions) AS total_conversion
FROM nykaa_campaign_data_analysis
GROUP BY Customer_segment
ORDER BY total_revenue DESC;

-- Best campaign 

SELECT 
Campaign_Type,
SUM(Revenue) AS total_revenue,
ROUND(AVG(ROI),2) AS avg_roi,
SUM(Conversions) AS total_conversion
FROM nykaa_campaign_data_analysis
GROUP BY Campaign_Type
ORDER BY total_revenue DESC;

-- Best Campaign for Each Customer Segment

SELECT 
    Customer_segment,
    Campaign_Type,
    SUM(Revenue) AS revenue,
    ROUND(AVG(ROI),2) AS roi
FROM nykaa_campaign_data_analysis
GROUP BY Customer_segment, Campaign_Type
ORDER BY Customer_segment, revenue DESC; 

-- Funnel Performance

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


















