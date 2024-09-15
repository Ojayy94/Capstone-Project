
SELECT 
    c.CustomerId, 
    c.FirstName || ', '|| c.LastName AS CustomerName, 
    ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS LifetimeValue
FROM 
    customers c
JOIN 
    invoices i ON c.CustomerId = i.CustomerId
JOIN 
    invoice_items ii ON i.InvoiceId = ii.InvoiceId
GROUP BY 
    c.CustomerId
ORDER BY 
    LifetimeValue DESC 
LIMIT 5;