SELECT 
    STRFTIME('%Y-%m', i.InvoiceDate) AS Month, 
    ROUND(SUM(ii.Quantity * ii.UnitPrice), 2) AS TotalSales
FROM 
    invoices i
JOIN 
    invoice_items ii ON i.InvoiceId = ii.InvoiceId
GROUP BY 
    Month
ORDER BY 
    Month;