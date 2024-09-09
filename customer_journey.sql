with duplicaterecords as (
select JourneyID, CustomerID, ProductID, VisitDate, Stage, Action,Duration ,
ROW_NUMBER() 
over(partition by  CustomerID, ProductID, VisitDate, Stage, Action order by JourneyID) as Row_Num 
from dbo.customer_journey)
select * from duplicaterecords where ROW_NUM >1 order by JourneyID



select JourneyID, CustomerID, ProductID, VisitDate, Stage, Action,coalesce(Duration, Avg_Duration) as Duration 
from
(select JourneyID, CustomerID, ProductID, VisitDate, upper(Stage) as Stage , Action,Duration,AVG(Duration) over (partition by VisitDate) as Avg_Duration,
ROW_NUMBER() 
over(partition by  CustomerID, ProductID, VisitDate,Stage, Action order by JourneyID) as Row_Num 
from dbo.customer_journey) as subquery where Row_Num = 1;