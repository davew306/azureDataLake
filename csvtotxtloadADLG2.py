import pandas as pd
from azure.storage.filedatalake import DataLakeServiceClient

# Read the CSV file
df = pd.read_csv('nfl_stats.csv', encoding='utf-8')

# Convert to pipe-delimited format
df.to_csv('dw_nfl_stats.txt', sep='|', index=False)

# Create a Data Lake service client
service_client = DataLakeServiceClient(account_url="", credential="")

# Upload the file to Data Lake Gen2
file_system_client = service_client.get_file_system_client("dwDataLake")
file_system_client.create_file("dw-directory", "dw_nfl_stats.txt").upload_data(df.to_csv(index=False))