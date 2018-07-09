libname c '/folders/myfolders/case2';

proc sql;
create table c.distance
as select
a.*,b.*
from c.Sales as a left join c.london_postal_codes as b
on a.Customer_Postcode=b.Postcode;
quit;

data c.distance; set c.distance;
rename os_x=customer_x os_y=customer_y;
drop Postcode;
run;

proc sql;
create table c.distance
as select
a.*,b.*
from c.distance as a left join c.store_locations as b
on a.Store_Postcode=b.Postcode;
quit;

data c.distance; set c.distance;
rename os_x=store_x os_y=store_y;
drop Postcode Lat Long;
run;

data x; set c.distance;
run;

proc sql;
create table xx
as select *,
sqrt(((store_x-customer_x)**2)+((store_y-customer_y)**2)) as kilo
from x;
quit;

data xx; set xx; drop kilo; run;


/*long method*/
proc sql;
create table xx
as select *,
(store_x-customer_x)as kilox
from x;
quit;

proc sql;
create table xx
as select *,
(store_y-customer_y)as kiloy
from xx;
quit;

proc sql;
create table xx
as select *,
kilox**2as kilox2
from xx;
quit;

proc sql;
create table xx
as select *,
kiloy**2as kiloy2
from xx;
quit;

proc sql;
create table xx
as select *,
kilox2+kiloy2 as kilo1
from xx;
quit;

proc sql;
create table xx
as select *,
sqrt(kilo1) as kiloF
from xx;
quit;

proc sql;
create table xx
as select *,
kiloF/100 as kilometre
from xx;
quit;
/* Long Method End*/



/* Same result as above, short method*/
proc sql;
create table abc
as select *,
(store_x-customer_x)**2 + (store_y-customer_y)**2 as killoommeettrree
from xx;
quit;

proc sql;
create table abc
as select *,
sqrt(killoommeettrree)/100
from abc;
quit;
/* Same result as above, short method END*/




/* Method 2 ans seems wrong*/
proc sql;
create table xx
as select *,
((store_x-customer_x)**2)+((store_y-customer_y)**2) as kilometre22
from xx;
quit;

proc sql;
create table xx
as select *,
(sqrt(kilometre22))/100 as kilometre2
from xx;
quit;
/*end*/




/*wrong mega single code*/
proc sql;
create table xx
as select *,
sqrt(((store_x-customer_x)**2)+((store_y-customer_y)**2))/100 as haha
from xx;
quit;
/* END */
