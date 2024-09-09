SELECT [EngagementID]
      ,[ContentID]
      ,upper(replace([ContentType],'socialmedia','SOCIALMEDIA'))
      ,format(convert(date, [EngagementDate]), 'dd.MM.yyyy') as Date
      ,[CampaignID]
      ,[ProductID]
	  ,[Likes],
	  left(viewsclickscombined, charindex('-', viewsclickscombined)-1) as Views
      ,right (ViewsClicksCombined, LEN(viewsclickscombined)- CHARINDEX('-', viewsclickscombined)) as Clicks
  FROM [PortfolioProject_MarketingAnalytics].[dbo].[engagement_data]

  where ContentType != 'newsletter'
