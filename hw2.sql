-- задание 1
select c1.name as country_1, c2.name as country_2, c1.gov_form
from countries c1 
join countries c2 
on c1.gov_form = c2.gov_form 
and c1.name < c2."name"; 

-- задание 2
select c1.name as country_1, c2.name as country_2, c1.indep_year 
from countries c1 
join countries c2 
on c1.gov_form = c2.gov_form 
and c1.name < c2."name";

-- задание 3
select ct1.name as city_1, ct2.name as city_2, ct2.country_code
from cities ct1
join cities ct2
on ct1.country_code = ct2.country_code;

-- задание 4
select c1."name" as country_high, p1.fertility_rate as fertility_high, c2.name as country_low, p2.fertility_rate as fertility_low, c1.continent
from countries c1
join countries c2 
on c1.continent = c2.continent
and c1.name < c2.name 
join populations p1
on  c1.code = p1.country_code
join populations p2
on c1.code = p2.country_code
and p1.fertility_rate > p2.fertility_rate
where p1.year = 2015; 

-- задание 5
select c1.name, c1.continent, count(c2.name) as same_contnent 
from countries c1
join countries c2
on c1.continent = c2.continent 
and c1."name" < c2."name" 
group by c1."name", c1.continent  
order by c1."name"; 

-- задание 6 
select code, gross_savings
from economies2019
where gross_savings > (select avg(gross_savings)
from economies2019);

-- задание 7 
select name 
from countries 
where indep_year > (
select indep_year
from countries
where name = 'Kenya');

-- задание 8 
select c.name, p.life_expectancy 
from countries c
join populations p 
on c.code = p.country_code 
where p.year = 2015 and p.life_expectancy > (
select avg(life_expectancy)
from populations 
where year = 2015);

-- задание 9
select c.name, p.size 
from countries c
join populations p 
on c.code = p.country_code 
where p.year = 2015 and p.size > (
select avg(size)
from populations p
join countries c 
on p.country_code = c.code 
where p.year = 2015 and c.continent = 'Europe');

-- задание 10
select c.name, p.fertility_rate  
from countries c
join populations p 
on c.code = p.country_code 
where p.year = 2015 and p.fertility_rate is not null and p.fertility_rate > (select fertility_rate 
from populations
where fertility_rate is not null and size = (select max(size)
from populations));

-- задание 11
select name 
from countries c 
where code in (select code 
from eu_countries); 

-- задание 12 
select name 
from countries c 
where continent = 'Europe' and name not in (select name 
from eu_countries 
where code = c.code);

-- задание 13
select name 
from countries c 
where code not in (select code 
from languages 
where official = true);

-- задание 14
select name 
from countries c 
where code not in (select code 
from economies2015 ) and code in (select country_code
from populations 
where "year" = 2015); 

-- задание 15 
select name 
from countries c 
where continent = 'Europe' and name not in (select name 
from eu_countries) and code in (select code 
from economies
where year = 2010);

-- задание 16 
select name 
from countries c 
where c.continent = 'Europe' and code not in (select code 
from languages l 
where l.name in ('English', 'German', 'French')); 

-- задание 17 
select c.name  
from countries c 
where c.code in (
select e.code 
from economies e
where e.year = 2015 and e.income_group = (
	select income_group 
	from economies 
	where code = 'DEU' and year = 2015)) 
	and 
c.code not in (select eu.code 
from eu_countries eu)


-- задание 18 
select c.name 
from countries c
where c.code in (
select l.code 
from languages l 
where l.official = true and l.name in (select lan.name 
from languages lan 
where lan.official = true and lan.code = (select p.country_code
from populations p
where p.year = 2015 and p.size is not null
order by p.size desc
limit 1)))
and c.code <> (select p.country_code 
from populations p
where p.year = 2015 and p.size is not null
order by p.size desc
limit 1)







