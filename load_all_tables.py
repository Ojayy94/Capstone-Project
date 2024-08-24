# load_all_tables.py
import sqlite3
import pandas as pd

# Connect to the SQLite database
conn = sqlite3.connect(r"C:\Users\ayojo\Desktop\ALTSCHOOL\Third Semester\Project\chinook.db")

# Function to load all tables into a dictionary of DataFrames
def load_all_tables(conn):
    tables = {}
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    table_names = cursor.fetchall()
    
    for table_name in table_names:
        table_name = table_name[0]
        tables[table_name] = pd.read_sql_query(f"SELECT * FROM {table_name}", conn)
    
    return tables

# Load all tables
tables = load_all_tables(conn)

# Display the DataFrame of a specific table, e.g., 'albums'
print(tables['albums'].head())

# Close the connection
conn.close()

# Select the DataFrame to display in Power BI
albums = tables['albums']
albums

artists = tables['artists']
artists 

customers = tables['customers']
customers

employees = tables['employees']
employees

genres = tables['genres']
genres

invoices = tables['invoices']
invoices

invoice_items = tables['invoice_items']
invoice_items

media_types = tables['media_types']
media_types

playlists = tables['playlists']
playlists

playlist_track = tables['playlist_track']
playlist_track

tracks = tables['tracks']
tracks

# Call all the tables present in the database
tables