
use tableauproject;
select *   from  main;
#----------------------------------------------------question 4 ------------------------------

SELECT 
    c.Countryname, 
    m.City, 
    COUNT(m.RestaurantID) AS RestaurantCount
FROM Main m
LEFT JOIN Country c ON m.CountryCode = c.CountryID
GROUP BY c.Countryname, m.City;

#--------------------------------- question 5 ---------------------------------
SELECT 
    Year_Opening AS Year, 
    CONCAT('Q', CEILING(Month_Opening / 3)) AS Quarter, 
    Month_Opening AS Month, 
    COUNT(RestaurantID) AS RestaurantCount
FROM Main
GROUP BY Year_Opening, Quarter, Month_Opening
ORDER BY Year, Quarter, Month;

#-----------------------6-------------------------
SELECT 
    CASE 
        WHEN Rating < 1 THEN '0-1'
        WHEN Rating < 2 THEN '1-2'
        WHEN Rating < 3 THEN '2-3'
        WHEN Rating < 4 THEN '3-4'
        ELSE '5+'
    END AS Ratings,
    COUNT(RestaurantID) AS RestaurantCount
FROM Main
GROUP BY Ratings
order by Ratings;

    
    #----------------------------------7 question ---------------------
SELECT 
    CASE 
        WHEN Average_Cost_for_two < 10 THEN '0-10'
        WHEN Average_Cost_for_two < 20 THEN '10-20'
        ELSE '20+'
    END AS PriceBucket,
    COUNT(RestaurantID) AS RestaurantCount
FROM Main
GROUP BY 
    CASE 
        WHEN Average_Cost_for_two < 10 THEN '0-10'
        WHEN Average_Cost_for_two < 20 THEN '10-20'
        ELSE '20+'
    END;
#----------------------8th question----------------------------
SELECT 
    (CAST(SUM(CASE WHEN Has_Table_Booking = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(RestaurantID)) * 100 AS TableBookingPercentage
FROM Main;
#-----------------------------9th question------------------------------
SELECT 
    (CAST(SUM(CASE WHEN Has_Online_Delivery = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(RestaurantID)) * 100 AS OnlineDeliveryPercentage
FROM Main;
#--------------------------------10th question -------------------------
SELECT City, COUNT(RestaurantID) AS RestaurantCount
FROM Main
GROUP BY City
ORDER BY RestaurantCount DESC;


