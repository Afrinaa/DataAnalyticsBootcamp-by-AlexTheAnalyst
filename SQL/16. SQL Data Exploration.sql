-- checking the deaths tables
SELECT * 
FROM PortfolioProject.dbo.CovidDeaths
ORDER BY 3,4

-- when did the death started
SELECT location, date, total_cases, new_cases, total_deaths,  population
FROM PortfolioProject.dbo.CovidDeaths
WHERE total_deaths>0

-- percentage of deaths of infected people in US
SELECT 
	location, 
	date, 
	total_cases,
	total_deaths,
	(total_deaths/NULLIF(total_cases, 0))*100 AS percentage_of_death
FROM PortfolioProject.dbo.CovidDeaths
WHERE location like '%states%' 
ORDER BY 1,2

-- percentage of death vs population in Bangladesh
SELECT 
	location, 
	date, 
	population,
	total_deaths,
	(total_deaths/NULLIF(population, 0))*100 AS percentage_of_death
FROM PortfolioProject.dbo.CovidDeaths
WHERE location like 'Bangladesh' 
ORDER BY 1,2

-- looking at countries with Highest Infected Rate compared to Population
SELECT 
	location, 
	population,
	MAX(total_cases) AS HighestInfectionCount,
	MAX((total_cases/NULLIF(population, 0))*100) AS PercentageOfInfection
FROM PortfolioProject.dbo.CovidDeaths
GROUP BY location, population
ORDER BY PercentageOfInfection DESC

-- countries with Highest Death percentage 
SELECT 
	location, 
	MAX(cast(total_deaths AS int)) AS TotalDeathCount
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeathCount DESC

-- showing continents with highest death count per population
SELECT 
	location, 
	MAX(cast(total_deaths AS int)) AS TotalDeathCount
FROM PortfolioProject.dbo.CovidDeaths
WHERE 
	continent is null AND 
	location NOT LIKE '%countries%'
	AND location NOT LIKE '%union%'
	AND location NOT LIKE '%world%'
GROUP BY location
ORDER BY TotalDeathCount DESC

-- Global Numbers
SELECT 
	--date, 
	SUM(new_cases) AS TotalNewCases,
	SUM(cast(new_deaths as int)) AS TotalDeaths,
	(SUM(cast(new_deaths as int))/NULLIF(SUM(new_cases), 0))*100 AS DeathPercentage
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent is not null
--GROUP BY date
ORDER BY 1,2




-- checking the vaccination table
SELECT * 
FROM PortfolioProject.dbo.CovidVaccinations
ORDER BY 3,4

-- total population vs vaccination
SELECT 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	SUM(cast(vac.new_vaccinations as bigint)) 
	OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths	dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3

-- use CTEs
With PopVsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
AS 
(
	SELECT 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	SUM(cast(vac.new_vaccinations as bigint)) 
	OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
	FROM PortfolioProject..CovidDeaths	dea
	JOIN PortfolioProject..CovidVaccinations vac
		ON dea.location = vac.location
		AND dea.date = vac.date
	WHERE dea.continent IS NOT NULL
	--ORDER BY 2,3
)
SELECT *, (RollingPeopleVaccinated/Population)*100
FROM PopVsVac

-- Temp tables
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
	Continent nvarchar(255),
	Location NVARCHAR(255),
	Date DATETIME, 
	Population NUMERIC, 
	New_vaccination NUMERIC, 
	RollingPeopleVaccinated NUMERIC
)
INSERT INTO #PercentPopulationVaccinated
	SELECT 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	SUM(cast(vac.new_vaccinations as bigint)) 
		OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
	FROM PortfolioProject..CovidDeaths	dea
	JOIN PortfolioProject..CovidVaccinations vac
		ON dea.location = vac.location
		AND dea.date = vac.date
	WHERE dea.continent IS NOT NULL
	--ORDER BY 2,3
SELECT *, (RollingPeopleVaccinated/Population)*100
FROM #PercentPopulationVaccinated

-- creating view to store data for later visualization 
IF OBJECT_ID('PercentPopulationVaccinated', 'V') IS NOT NULL
    DROP VIEW PercentPopulationVaccinated;
GO

USE PortfolioProject;
GO

CREATE VIEW PercentPopulationVaccinated AS
SELECT 
    dea.continent,
    dea.location,
    dea.date,
    dea.population,
    vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations AS bigint)) 
        OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) 
        AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
        ON dea.location = vac.location
        AND dea.date = vac.date
WHERE dea.continent IS NOT NULL;
GO

SELECT * 
FROM PercentPopulationVaccinated