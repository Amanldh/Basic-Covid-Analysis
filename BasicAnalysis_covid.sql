Select * from 
Db..covidData 
ORDER by 3;

Select continent, location, date, total_cases, new_cases,
population, total_deaths, (total_deaths/total_cases)*100 as perDeaths
from
Db..covidData  where location ='india';

-- GLOBAL DATA
Select location, SUM(cast(total_cases as int)), Sum(cast (total_deaths as int))
from Db..covidData
Group by location
--WHERE  continent is not null ;

Select location,total_cases,total_deaths 
from Db..covidData
WHERE  continent is not null ;

--percentage of population infected
Select continent, location, date, total_cases, new_cases,
population, total_deaths, (total_cases/population)*100 as InfectedPercentage
from
Db..covidData  where continent is not NULL and 
  location = 'INDIA'
  
  
  --HIGHEST POPULATION INFECTION 


  Select location , population , MAX(total_cases) as highInfecRate,
  MAX((total_cases/population)*100) as percentageinfectedRate
  From Db..covidData 
  GROUP BY  population, LOCATION
  ORDER BY percentageinfectedRate DESC
 -- where continent is not null
  
