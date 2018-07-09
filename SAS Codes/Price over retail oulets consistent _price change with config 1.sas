libname c '/folders/myfolders/case2';

proc sql;
create table a 
as select Store_Postcode,configuration,
std(Retail_Price) as std
from c.sales
group by Store_Postcode,configuration
;
quit;

proc sql;
create table b
as select
mean(std) as std2,
Store_Postcode
from a
group by Store_Postcode
order by std2 desc
;
quit;


proc sql;
create table c
as select
Store_Postcode,
mean(Retail_Price) as Revenue,
month
from c.sales
where Store_Postcode in ("SW1P 3AU","CR7 8LE","W4 3PH","N3 1DH","E7 8NW")
group by Store_Postcode,month
order by Store_Postcode,Revenue desc
;
quit;

proc sql;
create table n1
as select
configuration,
month,
mean(Retail_Price) as Price
from c.sales
group by configuration,month;
quit;