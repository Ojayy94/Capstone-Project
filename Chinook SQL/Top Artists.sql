SELECT 
    a.Name AS ArtistName, 
    round(SUM(ii.Quantity * ii.UnitPrice),1) AS TotalSales
FROM 
    invoice_items ii
JOIN 
    tracks t ON ii.TrackId = t.TrackId
JOIN 
    albums al ON t.AlbumId = al.AlbumId
JOIN 
    artists a ON al.ArtistId = a.ArtistId
GROUP BY 
    a.Name
ORDER BY 
    TotalSales DESC
LIMIT 5;