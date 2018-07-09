libname c '/folders/myfolders/case2';

proc sql;
create table v
as select
Configuration,
sum(Retail_Price) as Revenue
from c.sales
group by Configuration;
quit;

proc sql;
create table g
as select
Configuration,
mean(Retail_Price) as price
from c.sales
group by Configuration;
quit;

proc means  data=g; run;

proc sql;
create table gg
as select *,
case
when price<459 then "Low"
when 459<=price<654 then "Medium"
else "High"
end as Configuration_Type
from g;
quit;

proc sql;
create table c.Config_Price_Type
as select a.*,b.*
from c.mconfig as a left join gg as b
on a.Configuration=b.Configuration;
quit;

proc sql;
create table ggg
as select
Configuration_Type,
sum(Retail_Price) as Revenue
from c.Config_Price_Type
group by Configuration_Type
order by Revenue;
quit;




