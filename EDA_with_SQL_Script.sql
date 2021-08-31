## total cases by location
 select location, sum(new_cases) as total_cases from covid group by location order by total_cases desc;
 
#death rate per country
select location, total_cases,total_deaths, round((total_deaths/total_cases)*100, 2) as death_rate from covid where date = (select max(date) from covid) order by 4 desc;

 ## the same for continents
select  continent, sum(new_cases),sum(new_deaths), round((sum(new_deaths)/sum(new_cases)),2) as death_rate from covid group by continent order by 4 desc;

#the global situation by each day
select location, date, new_cases, new_deaths, round((new_deaths/new_cases),2) as death_rate from covid where location = 'World';

#the worst days of COVID
select location, date, new_cases, new_deaths, round((new_deaths/new_cases),2) as death_rate from covid where location = 'World' order by 5 desc limit 5;

#mean death rate per day
select round(avg(round((new_deaths/new_cases),2)), 2) as mean_death_rate, avg(new_deaths) as mean_death_counts from covid where location = 'World';

#the day with the highest number of new infections
select date, new_cases, new_deaths from covid where new_cases = (select max(new_cases) from covid as maximum_cases);

#the day with the highest number of new deaths
select date, new_deaths, new_cases from covid where new_deaths = (select max(new_deaths) from covid as maximum_deaths);

select location, sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, round((sum(new_deaths)/sum(new_cases)), 2) as death_rate from covid where location like "%ussia%" group by location;

#ratio of country's population to its covid cases and death cases
select location, avg(population) as population, sum(new_cases) as cases, sum(new_deaths) as deaths, round(sum(new_deaths)/avg(population),5)*100 as death_percentage, round(sum(new_cases)/avg(population),5)*100 as cases_percentage from covid where continent is not null group by location order by 6 desc;

select location, max(people_fully_vaccinated) as total_vac, round(( max(people_fully_vaccinated) / avg(population)),2) as vac_rate from covid where continent is not null group by location order by 3 desc;

select location, max(total_vaccinations) as total_vac from covid where continent is not null group by location order by 2 desc;

select location, max(total_vaccinations) from covid where location = 'World' group by location








