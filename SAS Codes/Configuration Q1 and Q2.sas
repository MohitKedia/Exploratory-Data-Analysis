ods html file='/folders/myfolders/case2/Q3config.xls';

proc tabulate data=case2.mconfig;
var Retail_Price;
class screen;
table screen*Retail_Price*mean;
run;

proc tabulate data=case2.mconfig;
var Retail_Price;
class Battery;
table Battery*Retail_Price*mean; 
run;

proc tabulate data=case2.mconfig;
var Retail_Price;
class Ram;
table Ram*Retail_Price*mean; 
run;

proc tabulate data=case2.mconfig;
var Retail_Price;
class Processor;
table Processor*Retail_Price*mean; 
run;

proc tabulate data=case2.mconfig;
var Retail_Price;
class Integrated_Wireless;
table Integrated_Wireless*Retail_Price*mean; 
run;

proc tabulate data=case2.mconfig;
var Retail_Price;
class HD;
table HD*Retail_Price*mean; 
run;

proc tabulate data=case2.mconfig;
var Retail_Price;
class Bundle_Apps;
table Bundle_Apps*Retail_Price*mean; 
run;

ods html close;



proc sql;
create table aa
as select
Store_Postcode,
count(distinct Configuration) as config
from c.sales
group by Store_Postcode
order by config desc;
run;







