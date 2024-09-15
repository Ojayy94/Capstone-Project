SELECT 
    c.Country, 
    ROUND(SUM(ii.Quantity * ii.UnitPrice), 2) AS TotalSales,  
    COUNT(DISTINCT c.CustomerId) AS NumberOfCustomers, 
    COUNT(DISTINCT i.InvoiceId) AS NumberOfInvoices
FROM 
    customers c
JOIN 
    invoices i ON c.CustomerId = i.CustomerId
JOIN 
    invoice_items ii ON i.InvoiceId = ii.InvoiceId
GROUP BY 
    c.Country
ORDER BY 
    TotalSales DESC;