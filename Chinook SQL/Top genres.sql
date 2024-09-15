SELECT 
    g.Name AS GenreName, 
    COUNT(ii.TrackId) AS TrackCount, 
    ROUND(SUM(ii.Quantity * ii.UnitPrice), 2) AS TotalSales
FROM 
    invoice_items ii
JOIN 
    tracks t ON ii.TrackId = t.TrackId
JOIN 
    genres g ON t.GenreId = g.GenreId
GROUP BY 
    g.Name
ORDER BY 
    TotalSales DESC
LIMIT 5;