use HR;
go
select 
--- we adding age column
Alter TABLE [Human Resources]
add  Age  int;
go
Update [Human Resources]
set Age = Datediff(Year, birthdate , '2021-1-1') 

select * from [Human Resources]
SELECT *
FROM dbo.[Human Resources];

SELECT c.name --AS ColumnName
FROM sys.columns c
WHERE c.object_id = object_id('dbo.[Human Resources]');

--- general statistics

Select Count(id) as [Total employee] from [Human Resources]

Select Count(id) as [Current employees] from [Human Resources]
where  termdate iS NULL

Select Count(id) as [Resigned employees] from [Human Resources]
where  termdate is NOT NULL

Select department,Count(id) as [total employee] from [Human Resources]
Group By department
order by [total employee] desc
go
Select gender,Count(id) as [total employee] from [Human Resources]
Group By gender

Select location_state,Count(id) as [total employee] from [Human Resources]
Group By location_state

-- analysis current and Resigned employees
SELECT
DATENAME(YEAR,hire_date)as [The year],
COUNT(id) AS [Total Employee],
COUNT (CASE when termdate is not null then id END)as [Total Employee Resigned], 
COUNT (CASE when termdate is  null then id END)as [Total Employee current] 

from [Human Resources]
group by (DATENAME(YEAR,hire_date))
order by [The year] asc

-- EMPLOYEE AND DEPARTMENT

SELECT  department, count(id)as [Total Employee leaved]  from [Human Resources]
where termdate is  not null
group by (department)
order by [Total Employee leaved] desc

SELECT  department, count(id)as [Total Employee]  from [Human Resources]
where termdate is   null
group by (department)
order by [Total Employee] desc

SELECT  DATEDIFF(YEAR,hire_date,'2020-01-01') as [Experience Year],count(id)  as Total_Eployee  from [Human Resources]
where termdate is  null
group by (DATEDIFF(YEAR,hire_date,'2020-01-01'))
order by [Experience Year] asc

SELECT  DATEDIFF(YEAR,birthdate,'2020-01-01') as [Age],count(id)  as Total_Eployee  from [Human Resources]
where termdate is  null
group by (DATEDIFF(YEAR,birthdate,'2020-01-01'))
order by [Age] asc

SELECT  jobtitle, count(id)as [Total Employee]  from [Human Resources]
where termdate is  not null
group by (jobtitle)
order by [Total Employee] asc

SELECT  location_state, count(id)as [Total Employee]  from [Human Resources]
where termdate is  not null
group by (location_state)
order by [Total Employee] asc

SELECT  race, count(id)as [Total Employee]  from [Human Resources]
where termdate is  not null
group by (race)
order by [Total Employee] asc