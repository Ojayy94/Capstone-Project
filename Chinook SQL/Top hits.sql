SELECT 
    t.Name AS TrackName, 
    COUNT(ii.Quantity) AS UnitsSold
FROM 
    invoice_items ii
JOIN 
    tracks t ON t.TrackId = ii.TrackId
GROUP BY 
    t.Name
ORDER BY 
    UnitsSold DESC
LIMIT 8;