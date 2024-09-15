import sqlite3
import pandas as pd
conn = sqlite3.connect(r"C:\Users\ayojo\Desktop\ALTSCHOOL\Third Semester\Project\chinook.db")

# Finding common combinations of tracks purchased together using the scopes of Apriori Algorithm
test_task = """
WITH pairings AS (
    SELECT 
        ii1.TrackId AS firstTrack, 
        ii2.TrackId AS secondTrack, 
        COUNT(*) AS Pairs
    FROM 
        invoice_items ii1
    JOIN 
        invoice_items ii2 ON ii1.InvoiceId = ii2.InvoiceId
    WHERE 
        ii1.TrackId < ii2.TrackId
    GROUP BY 
        ii1.TrackId, ii2.TrackId
)
SELECT 
    tr1.Name AS TrackName1, 
    tr2.Name AS TrackName2, 
    pr.Pairs
FROM 
    pairings pr
JOIN 
    tracks tr1 ON pr.firstTrack = tr1.TrackId
JOIN 
    tracks tr2 ON pr.secondTrack = tr2.TrackId
ORDER BY 
    pr.Pairs DESC;
"""

# Load data into a pandas dataframe
market_analysis = pd.read_sql(test_task, conn)

# Call the data
market_analysis

