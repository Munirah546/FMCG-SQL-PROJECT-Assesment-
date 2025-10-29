SELECT * FROM mysql_firstwork.fmcg_sql_assesment;

-- create new column (Territory)
alter table fmcg_sql_assesment
add column Territory varchar(20);

update fmcg_sql_assesment
set Territory = CASE
WHEN COUNTRIES IN ('Nigeria', 'Ghana') 
THEN 'Anglophone'
WHEN COUNTRIES IN ('Senegal', 'Benin', 'Togo')
THEN 'Francophone'
ELSE 'other'
END;


-- 1)  what was the profit worth of bwereies in angolaphone and fancophone in 3 years
select Territory, sum(PROFIT) as Total_PROFIT
from fmcg_sql_assesment
group by Territory;

-- 2)COMPARE TOTAL PROFIT BETWEEN THE 2 TERRITORIES
select Territory, sum(PROFIT) as Total_PROFIT
from fmcg_sql_assesment
group by Territory
order by Total_Profit desc;

-- 3) find the Country with the highest profit in 2019
select COUNTRIES, sum(PROFIT) as Total_PROFIT
from fmcg_sql_assesment
where YEARS = 2019
group by COUNTRIES
order by Total_Profit desc 
limit 1;


-- 4) find the year With highest Profit
select YEARS, sum(PROFIT) as Total_PROFIT
from fmcg_sql_assesment
group by YEARS
order by Total_Profit desc 
limit 1;

-- 5) Which month in the three years generated the least profit
select MONTHS, sum(PROFIT) as Total_PROFIT
from fmcg_sql_assesment
group by MONTHS
order by Total_Profit asc
limit 1;
 
 -- 6) what was the minimum profit in december 2018
 select Min(PROFIT) as Min_Profit
from fmcg_sql_assesment
where YEARS = 2018 and MONTHS = 'December';

-- 7)Compare the profit percentage for each month in 2019
select MONTHS, sum(Profit) as Total_Profit, 
 (sum(Profit) / (select sum(PROFIT)
from fmcg_sql_assesment where YEARS = 2019) * 100) as Profit_Percentage
from fmcg_sql_assesment
where YEARS = 2019
group by MONTHS
order by MONTHS;

-- 8) which brand generated thr highest profit in senegal
select YEARS, sum(PROFIT) as Total_PROFIT
from fmcg_sql_assesment
group by YEARS
order by Total_Profit desc 
limit 1;

-- 9) calculate profit over the month
select MONTHS, sum(PROFIT) as Total_PROFIT
from fmcg_sql_assesment
group by YEARS, MONTHS
order by YEARS, MONTHS;

-- 10 within the last 2 years, the brand manager wants to know the top three brands consumed in francophone countries
select BRANDS, sum(PROFIT) as Total_PROFIT
from fmcg_sql_assesment
where Territory = 'Francophone' and YEARS >= 2018
group by BRANDS
order by Total_Profit desc
limit 3;

-- 11) find the top 2 choice of consumer brands in ghana
select BRANDS, sum(PROFIT) as Total_PROFIT
from fmcg_sql_assesment
where COUNTRIES = 'Ghana'
group by BRANDS
order by Total_Profit desc
limit 2;

-- 12 find out the details  of beer consumed in the past 3 years in the most oil reached country in west Africa
select COUNTRIES, sum(QUANTITY) as Total_Beer_consumed
from fmcg_sql_assesment
where COUNTRIES = 'Nigeria'
group by COUNTRIES;

-- 13 Favorite malt brand in anglophone between 2018 and 2019
select BRANDS, sum(PROFIT) as Total_Profit
from fmcg_sql_assesment
where Territory = 'Anglophone' and BRANDS like '%malt%' and YEARS between 2018 and 2019
group by BRANDS
order by Total_Profit desc
limit 1;

-- 14 which brand sols the highestin 2019 in nigeria
select BRANDS, sum(PROFIT) as Total_Profit
from fmcg_sql_assesment
where COUNTRIES = 'Nigeria' and YEARS = 2019
group by BRANDS
order by Total_Profit desc
limit 1;

-- 15 favorite brand in south_south in nigeria
select BRANDS, sum(PROFIT) as Total_Profit
from fmcg_sql_assesment
where REGION = 'Southsouth' and COUNTRIES = 'Nigeria'
group by BRANDS
order by Total_Profit desc
limit 1;

-- 16 Beer consumption in nigeria
select sum(QUANTITY) as Total_Beer_Consumption
from fmcg_sql_assesment
where COUNTRIES = 'Nigeria';

-- 17 Level of comsumption of budweiser in the region in nigeria
select REGION, sum(QUANTITY) as Total_Budweiser_Consumption
from fmcg_sql_assesment
where COUNTRIES = 'Nigeria' and BRANDS = 'Budweiser'
group by REGION;

-- 18 level of comsumption in budweiser in the region  in nigeria in 2019 (Decision in promo)
select REGION, sum(QUANTITY) as Total_Budweiser_Consumption_2019
from fmcg_sql_assesment
where COUNTRIES = 'Nigeria' and BRANDS = 'Budweiser' and YEARS = 2019
group by REGION;

-- 19 Country with the highest consumption of beer
select COUNTRIES, sum(QUANTITY) as Total_Consumption
from fmcg_sql_assesment
group by COUNTRIES
order by Total_Consumption desc
limit 1;

-- 20 highest sales personnel of Budweiser in sensgal
select SALES_REP, sum(PROFIT) as Total_Sales
from fmcg_sql_assesment
where BRANDS = 'Budweiser' And COUNTRIES = 'Senegal'
group by SALES_REP
order by Total_Sales desc
limit 1;

-- 21)Country with the highest profit of the fourth quater in 2019
select COUNTRIES, sum(PROFIT) as Total_PROFIT
from fmcg_sql_assesment
where YEARS = 2019 and MONTHS in ('October', 'November', 'December')
group by COUNTRIES
order by Total_Profit desc
limit 1;




 





 





