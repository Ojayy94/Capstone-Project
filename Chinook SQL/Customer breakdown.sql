SELECT 
    c.CustomerId, 
    c.FirstName || ', ' || c.LastName AS CustomerName,  
    c.Country, 
    ROUND(SUM(ii.Quantity * ii.UnitPrice), 2) AS TotalSpent, 
    COUNT(DISTINCT i.InvoiceId) AS PurchaseCount
FROM 
    customers c
JOIN 
    invoices i ON c.CustomerId = i.CustomerId
JOIN 
    invoice_items ii ON i.InvoiceId = ii.InvoiceId
GROUP BY 
    c.CustomerId
ORDER BY 
    TotalSpent DESC;