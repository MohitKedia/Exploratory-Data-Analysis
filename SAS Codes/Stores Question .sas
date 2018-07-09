
libname c '/folders/myfolders/case2';
data abc; set c.Sales; run;

proc sql;
create table q2_1
as select 
Store_Postcode,
sum(Retail_Price) as Revenue
from abc
group by Store_Postcode
order by Revenue desc;
quit;


ods html file='/folders/myfolders/stores selling percentage.xlsx';

proc sql;
create table q2_2
as select 
Store_Postcode,
Revenue,
sum(Revenue) as total,
(Revenue/calculated total)*100 as percent
from q2_1
quit;

ods html close;
