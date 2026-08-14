SELECT TOP (1000) [ID]
      ,[Year_Birth]
      ,[Education]
      ,[Marital_Status]
      ,[Income]
      ,[Kidhome]
      ,[Teenhome]
      ,[Dt_Customer]
      ,[Recency]
      ,[MntWines]
      ,[MntFruits]
      ,[MntMeatProducts]
      ,[MntFishProducts]
      ,[MntSweetProducts]
      ,[MntGoldProds]
      ,[NumDealsPurchases]
      ,[NumWebPurchases]
      ,[NumCatalogPurchases]
      ,[NumStorePurchases]
      ,[NumWebVisitsMonth]
      ,[AcceptedCmp3]
      ,[AcceptedCmp4]
      ,[AcceptedCmp5]
      ,[AcceptedCmp1]
      ,[AcceptedCmp2]
      ,[Complain]
      ,[Z_CostContact]
      ,[Z_Revenue]
      ,[Response]
  FROM [MARKETING_CAMPAIGN].[dbo].[marketingCampaign]


SELECT TOP 10 * FROM MarketingCampaign;

SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'MarketingCampaign'
AND COLUMN_NAME LIKE '%Accepted%';


---TOTAL CUSTOMERS
SELECT COUNT (*) AS TotalCustomer
FROM MarketingCampaign;


---CAMPAIGN RESPONSE
SELECT Response , COUNT (*) AS CustomerCount
FROM MarketingCampaign
GROUP BY Response;


---COMPARING THE 5 CAMPAIGNS
SELECT
   SUM ( CAST(AcceptedCmp1 AS INT) ) AS Campaign1,
   SUM ( CAST(AcceptedCmp2 AS INT) ) AS Campaign2,
   SUM ( CAST(AcceptedCmp3 AS INT) ) AS Campaign3,
   SUM ( CAST(AcceptedCmp4 AS INT) ) AS Campaign4,
   SUM ( CAST(AcceptedCmp5 AS INT)) AS Campaign5
FROM MarketingCampaign;


---RESPONSE BY EDUCATION
SELECT Education, Response, COUNT (*) AS CustomerCount
FROM MarketingCampaign
GROUP BY Education, Response
ORDER BY Education, Response;


---SPENDING BY EDUCATION
SELECT Education,
  SUM (MntWines) AS WineSpending,
  SUM (MntFruits) AS FruitSpending,
  SUM (MntMeatProducts) AS MeatSpending,
  SUM (MntFishProducts) AS FishSpending,
  SUM (MntSweetProducts) AS SweetSpending,
  SUM (MntGoldProds) AS GoldSpending
FROM MarketingCampaign
GROUP BY Education
ORDER BY Education;


---SPENDING OF RESPONDERS AND NON RESPONDERS
SELECT Response, COUNT (*) AS CustomerCount,
 AVG (MntWines + MntFruits + MntMeatProducts + MntFishProducts + MntSweetProducts + MntGoldProds) AS AvgSpending
FROM MarketingCampaign
GROUP BY Response;


