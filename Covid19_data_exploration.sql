/*
Covid 19 Data Exploration 

SQL skills demonstrated: Joins, CTEs, Temporary Tables, Window Functions, Aggregate Functions, Creating Views

This script analyzes Covid-19 data to explore different aspects like infection rates, vaccination coverage, and mortality rates across different regions and dates.
*/

-- Set the working database
USE PortfolioProject1;

-- Basic Data Exploration: Listing Covid Death Details
SELECT 
    *
FROM
    CovidDeaths
WHERE
    continent != ''
ORDER BY 3, 4;

-- Detailed Case Report by Location and Date
SELECT 
    Location,
    date,
    total_cases,
    new_cases,
    total_deaths,
    population
FROM
    CovidDeaths
WHERE
    continent != ''
ORDER BY 1, 2;

-- Calculate Death Percentage: Likelihood of Dying from Covid if Contracted
DROP VIEW IF EXISTS DeathPercentage;
CREATE VIEW DeathPercentage AS
SELECT 
    Location,
    date,
    total_cases,
    total_deaths,
    (total_deaths / total_cases) * 100 AS DeathPercentage
FROM
    CovidDeaths
WHERE
    continent != ''
ORDER BY 1, 2;

-- Calculate Case Percentage: Percentage of Population that Contracted Covid
DROP VIEW IF EXISTS CasePercentage;
CREATE VIEW CasePercentage AS
SELECT 
    Location,
    date,
    population,
    total_cases,
    (total_cases / population) * 100 AS CasePercentage
FROM
    CovidDeaths
WHERE
    continent != ''
ORDER BY 1, 2;

-- Infection Rate Analysis: Identifying Countries with the Highest Infection Rates
DROP VIEW IF EXISTS HighestInfectionRate;
CREATE VIEW HighestInfectionRate AS
SELECT 
    Location,
    population,
    MAX(total_cases) AS HighestInfectionCount,
    MAX((total_cases / population)) * 100 AS PercentPopulationInfected
FROM
    CovidDeaths
WHERE
    continent != ''
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC;

-- Mortality Analysis: Countries with the Highest Covid Death Counts
DROP VIEW IF EXISTS HighestDeathCount;
CREATE VIEW HighestDeathCount AS
SELECT 
    Location, MAX(total_deaths) AS TotalDeathCount
FROM
    CovidDeaths
WHERE
    continent != ''
GROUP BY location
ORDER BY TotalDeathCount DESC;

-- Continental Analysis: Continents with the Highest Death Counts
DROP VIEW IF EXISTS ContinentalDeathCount;
CREATE VIEW ContinentalDeathCount AS
SELECT 
    continent, MAX(total_deaths) AS TotalDeathCount
FROM
    CovidDeaths
WHERE
    continent != ''
GROUP BY continent
ORDER BY TotalDeathCount DESC;

-- Global Analysis: Daily New Cases and Death Percentages
DROP VIEW IF EXISTS GlobalNumbers;
CREATE VIEW GlobalNumbers AS
SELECT 
    date,
    SUM(new_cases) AS TotalCases,
    SUM(new_deaths) AS NewDeaths,
    SUM(new_deaths) / SUM(new_cases) * 100 AS DeathPercentage
FROM
    CovidDeaths
WHERE
    continent != ''
GROUP BY date 
ORDER BY 1, 2;

-- Vaccination Coverage Analysis: Rolling Vaccination Numbers and Percentages
DROP VIEW IF EXISTS VaccinationCoverage;
CREATE VIEW VaccinationCoverage AS
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated,
    (RollingPeopleVaccinated / population) * 100 AS VaccinationPercentage
FROM
    CovidDeaths AS dea
    JOIN
    CovidVaccinations AS vac
ON
    dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent != ''
ORDER BY 2, 3;

-- Temporary Table for Quick Data Retrieval: Vaccination vs Population
DROP TABLE IF EXISTS TempPercentPopulationVaccinated;
CREATE TEMPORARY TABLE IF NOT EXISTS TempPercentPopulationVaccinated
(
    continent VARCHAR(100),
    location VARCHAR(100),
    date DATE,
    population BIGINT,
    new_vaccinations INT,
    RollingPeopleVaccinated BIGINT
);

INSERT INTO TempPercentPopulationVaccinated
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    SUM(vac.new_vaccinations) OVER (Partition by dea.location ORDER BY dea.date)
    AS RollingPeopleVaccinated
FROM
    CovidDeaths AS dea
    JOIN
    CovidVaccinations AS vac
ON
    dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent != '';

SELECT
    *,
    (RollingPeopleVaccinated / Population) * 100 AS RollingPeoplePercentage
FROM
    TempPercentPopulationVaccinated;
