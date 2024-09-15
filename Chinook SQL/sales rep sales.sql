SELECT 
    e.EmployeeId, 
    e.FirstName || ', ' || e.LastName AS EmployeeName, 
    ROUND(SUM(ii.Quantity * ii.UnitPrice), 2) AS TotalSales, 
    COUNT(DISTINCT i.InvoiceId) AS InvoicesProcessed
FROM 
    employees e
JOIN 
    customers c ON e.EmployeeId = c.SupportRepId
JOIN 
    invoices i ON c.CustomerId = i.CustomerId
JOIN 
    invoice_items ii ON i.InvoiceId = ii.InvoiceId
GROUP BY 
    e.EmployeeId
ORDER BY 
    TotalSales DESC;