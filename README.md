# StarWarsSQLAPISNL


This project consists of creating a local API to request and post queries from -and to- MySQL. 

It is divided into 5 steps:

1) Downloaded the Star Wars IV, V and VI scripts from kaggel.com

2) Cleaned the scripts and transformed them into a csv file

3) Created a MySQL relational database consisting of three tables: Character, Episode and Dialogue.

4) Inserted the cleaned data from the csv to MySQL from jupyter notebooks

5) Created the API with the following endpoints:
    - "/characters": return all characters from the movies

    - "/quotes/<character>": return all quotes from a specific characters

    - "/sentiment/<character>" return the 'compound' sentiment analysis from a specific character and determines wether it is positive, neutral or negative

    - "/newcharacter", methods=["POST"]: when called, helps insert a new character into MySQL database from jupyter notebooks


The project is created in Visual Studio Code and Jupyter Notebooks.

Files:
- config: contains the connection to MySQL
- data: contains the original scripts, cleaned csv and MySQL model
- notebooks: 
    - DataCleaning: steps used to transform the scripts into a csv
    - InsertCleaning: functions used to insert csv into MySQL
    - apiTests: contain API tests
- tools: 
    - cleaning: functions employed to clean the scripts
    - sqltools: functions employed to create the API
- main.py: contain the endpoints and functions that run the API
