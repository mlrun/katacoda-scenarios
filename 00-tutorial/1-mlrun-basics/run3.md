Now we will run the training function, and set the input to point to the CSV file (using the `-i` flag):

`mlrun run -f trainer -p label_column=label -i dataset=./artifacts/dataset.csv --local`{{execute}}

> MLRun uses special Data URIs which support different data sources and **MLRun Feature Store** objects, 
> data versioning, and security, read more about MLRun [Data Stores and Data Items](https://docs.mlrun.org/en/latest/store/datastore.html). 

Inside the function (see `trainer.py`{{open}}) we use the `DataItem` object which allow us to access data regardless of its type, 
physical location, format, etc. 

The `dataset.as_df()` call simply returns a dataframe without the headache of using specific data backend APIs or format.

`DataItems`, support other methods like `get`, `put`, `upload`, `download`, `show`, etc. And work with local/remote files,  
object storage (AWS S3, Azure Blob / Datalake, Google GCS), and some structured data sources.
