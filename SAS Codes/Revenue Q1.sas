libname c '/folders/myfolders/case2';

proc sql;
create table x
as select
Store_Postcode,
sum(Retail_Price) as revenue
from c.sales
group by Store_Postcode
order by revenue desc;
quit;

proc sql;
create table xx
as select
Store_Postcode,
revenue,
sum(revenue) as total,
(revenue/calculated total)*100 as percent
from x;
quit;

proc sql;
create table final
as select
Store_Postcode,percent from xx; 
quit;