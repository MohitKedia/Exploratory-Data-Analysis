libname c '/folders/myfolders/case2';

proc sql;
create table c.distance
as select a.*,b.*
from c.Sales as a left join c.store_locations as b
on a.Store_Postcode=b.Postcode;
quit;

data c.distance; set c.distance;
drop Date Postcode Lat Long;
rename os_x=store_x os_y=store_y;
run;

proc sql;
create table c.distance
as select a.*,b.*
from c.distance as a left join c.london_postal_codes as b
on a.Customer_Postcode=b.Postcode;
quit;

data c.distance; set c.distance;
drop Postcode;
rename os_x=customer_x os_y=customer_y;
run;

data x; set c.distance; run;

proc sql;
create table xx
as select *,
(sqrt((((store_x-customer_x)**2)+((store_y-customer_y)**2))))/1000 as kilo
from x;
quit;



