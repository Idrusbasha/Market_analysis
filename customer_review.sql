SELECT TOP (1000) [ReviewID]
      ,[CustomerID]
      ,[ProductID]
      ,[ReviewDate]
      ,[Rating]
      ,replace(ReviewText,'  ',' ') as ReviewText
  FROM [PortfolioProject_MarketingAnalytics].[dbo].[customer_reviews]
