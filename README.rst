COVID-19 Data Exploration with SQL
==================================

Overview
--------

Welcome to the COVID-19 Data Exploration project. This SQL-based project is designed to provide a deep dive into global COVID-19 data, focusing on deaths and vaccinations. It serves as both an educational tool and a practical resource for data analysts, researchers, and anyone interested in understanding the impacts of the pandemic through data.

Purpose and Functionality
-------------------------

This project aims to:

- **Educational Tool**: Enhance SQL skills through practical application, covering advanced SQL techniques including joins, CTEs, temporary tables, window functions, aggregate functions, and creating views
- **Research and Analysis**: Provide a robust framework for analyzing COVID-19 data to study trends, infection rates, mortality rates, and vaccination coverage across different regions and time periods

Prerequisites
-------------

Ensure you have the following before starting:

- **MySQL Server**: Either MySQL or another SQL server should be installed.
- **SQL Knowledge**: A solid understanding of SQL syntax and database operations (but you can also start your SQL journey with this project; it will require more effort to understand all the queries).
- **Development Environment**: An SQL-friendly text editor, IDE (e.g., Visual Studio Code with an SQL extension), or simply the MySQL Workbench and your terminal.

Data Source
-----------

This project utilizes COVID-19 data, which can be sourced from two different places depending on your needs:

1. **Provided CSV Files**: For convenience and to ensure consistency with the project setup demonstrated, use the `CovidDeaths.csv` and `CovidVaccinations.csv` files included in this repository. These files are based on a specific snapshot of the data, making them ideal for replicating the exact analysis presented.

2. **Up-to-Date Data**: If you require the most recent data to perform ongoing or updated analyses, download the latest datasets directly from the *Our World in Data* GitHub repository. Access the up-to-date data here: `Our World in Data COVID-19 dataset <https://github.com/owid/covid-19-data/tree/master/public/data>`_. Be aware that using the most current data might introduce differences due to updates or changes in data collection methodologies by *Our World in Data*.

Choose the data source that best fits your analytical needs. The SQL scripts provided may need slight adjustments if the dataset formats have been updated or changed since the creation of this project.


The Set-Up
-------------

Database Initialization
~~~~~~~~~~~~~~~~~~~~~~~

1. Create a new database schema `covid_19` and establish the connection, typically named `Covid19SQL`.

Table Creation and Data Import
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Follow these steps to configure your system for local file imports and set up your database tables:

1. **Enable Local File Import**: Configure your MySQL server to allow local file imports by setting `local_infile = 1` in both the server and client configuration files.
2. **Create Tables**: Execute the provided SQL scripts to create the `CovidDeaths` and `CovidVaccinations` tables. The scripts are available in the `sql/` directory [here](link-to-directory).
3. **Import Data**: Use the `LOAD DATA LOCAL INFILE` command to populate the tables with data from the provided CSV files.

ALTERNATIVELY, navigate to the 'Tables' section under your schema in the MySQL workbench and use the 'Table Data Import Wizard' to create your tables directly with your .csv files.

Detailed Script Explanations
----------------------------

The SQL scripts included in this project demonstrate a variety of data manipulation and querying techniques:

- **Basic Data Queries**: Retrieve data from the database to understand the basic structure and content.
- **Analytical Views**: Create views to facilitate more complex analyses like mortality rate calculations, vaccination coverage, and high infection rates among populations.
- **Advanced Analysis**: Use advanced SQL features to conduct in-depth research and generate meaningful insights from the data.

Usage Instructions
------------------

- **Data Retrieval**: Start by exploring the basic data retrieval scripts to familiarize yourself with the dataset.
- **Data Analysis**: Progress to more complex analytical queries that utilize views and window functions for deeper insights.
- **Custom Queries**: Encouraged to modify and extend the SQL scripts to tailor the analysis to specific research questions or interests.

Contributing
------------

Contributions are welcome to enhance the project's functionality or documentation:

- **Fork the Repository**: Make your own version of the project and experiment with new features or improvements.
- **Submit Pull Requests**: If you develop enhancements that could benefit the broader project, please submit a pull request.

Project Evolution and Learning Path
-----------------------------------

- **Query Optimization**: Learn to refine SQL queries for performance.
- **Schema Refinement**: Adapt the database schema to include additional data points or optimize query performance.
- **Integrate Data Visualization**: Use SQL data outputs with visualization tools to create impactful representations of pandemic data.

Documentation and Learning Resources
-------------------------------------

- **Detailed Comments**: Each SQL script is extensively commented to explain its functionality and the SQL techniques used.
- **Learning Resources**: For those new to certain SQL aspects, online tutorials and courses are recommended to bolster understanding.

Future Development
------------------

The project is envisioned as a dynamic resource:

- **Enhanced Analytical Features**: Develop more sophisticated SQL queries or incorporate additional analytical tools.
- **Collaboration and Community**: Engage with the community through discussions, collaborations, and shared learning.

Licensing
---------

This project is licensed under the MIT License - see the LICENSE file for details.
