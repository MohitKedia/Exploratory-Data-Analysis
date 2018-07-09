libname c '/folders/myfolders/case2';

data x; set c.distance; run;

data xx; set x;
kilo=(sqrt( ((store_x-customer_x)**2) + ((store_y-customer_y)**2) ))/1000 ;
run;

proc means data=xx;
var kilo;
run;

data xx2; set xx;
kilo=round(kilo);
run;

proc means data=xx2;
var kilo;
run;

proc sql;
create table xx2a
as select
sum(Retail_Price) as Revenue,
kilo
from xx2
group by kilo
order by Revenue desc;
run;

proc sql;
create table xx2b
as select *,
sum(Revenue) as total,
(Revenue/calculated total)*100 as percent
from xx2a;
quit;

proc sql;
create table xx2c
as select
kilo,
percent
from xx2b;
quit;





