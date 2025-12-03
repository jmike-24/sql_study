-- задание 1
select code, name, percent 
from languages l1 
where percent > (
	select avg(percent) 
	from languages l2
	where l1.code = l2.code); 

-- задание 2 
select name, country_code, metroarea_pop 
from cities c 
where metroarea_pop < (
	select avg(metroarea_pop)
	from cities c1
	where c.country_code = c1.country_code);

-- задание 3 
select code, income_group, gdp_percapita 
from economies e 
where year = 2015 and gdp_percapita > (
	select avg(gdp_percapita)
	from economies e1 
	where e.year = e1.year and e.income_group = e1.income_group); 

-- задание 4 
select country_code, name, city_proper_pop 
from cities c 
where city_proper_pop = (
	select max(city_proper_pop) 
	from cities c1 
	where c.country_code = c1.country_code); 

-- задание 5 
select name 
from countries c
where exists (
	select 1 
	from populations p
	where c.code = p.country_code); 

-- задание 6 
select name 
from countries c 
where exists (
	select 1 
	from languages l 
	where c.code = l.code and not exists (
		select 1 
		from languages l1 
		where l.name = l1.name and 
		l.code <> l1.code))
		
-- задание 7 
select name 
from countries c 
where exists (
	select 1 
	from economies e
	where c.code = e.code and year = 2015 and e.exports > e.imports) 

-- задание 8 
select distinct (c.code), c.name
from countries c
join languages l1
on c.code = l1.code  
join languages l2 
on l1.name = l2.name 
and l1.code <> l2.code;

select distinct (c.code), c.name
from countries c
where exists (
	select 1
	from languages l1
	join languages l2 
	on l1.name = l2.name 
	and l1.code <> l2.code
	where c.code = l1.code)

-- задание 9 
select name, capital 
from countries c 
where exists (
select 1 
from cities ct
where c.capital = ct.name and city_proper_pop > 1000000)

-- задание 10 
select ec.code, unemployment_rate 
from economies ec
join countries c 
on ec.code = c.code
where year = 2015 and unemployment_rate > (
	select avg(unemployment_rate)
	from economies e
	join countries ct
	on e.code = ct.code
	where c.continent = ct.continent) 

-- задание 11
select code, name, percent 
from languages l 
where percent is not null and percent = (
	select max(percent)
	from languages ln 
	where l.code = ln.code)
	

