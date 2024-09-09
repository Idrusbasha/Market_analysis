SELECT  [ProductID]
      ,[ProductName],
      [Price],
	  case
	  when price < 50 then 'Low'
	  when price between 50 and 200 then 'medium'
	  else 'High'
	  end as price_catergory 
  FROM [PortfolioProject_MarketingAnalytics].[dbo].[products]
