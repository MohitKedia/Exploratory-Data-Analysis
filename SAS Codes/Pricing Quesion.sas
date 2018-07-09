libname c '/folders/myfolders/case2';
data a1; set c.config_price_type; run;

proc sql;
create table u
as select Configuration,
mean(Retail_Price) as avg_price
from a1
where month=1
group by Configuration;
quit;



ods html file='/folders/myfolders/case2/price change.xls';
proc tabulate  data=a1;
var Retail_Price;
class Configuration month;
table Configuration,month*Retail_Price*mean;
run;
ods html close;


proc import 
datafile='/folders/myfolders/case2/price change.xlsx' out=c.price_change
dbms=xlsx replace;
getnames=yes; 
run;

data price_changel; set c.price_change;
format m1_1 12.;
m1_1=input(m1,12.);
run;

data price_changel; set price_changel;
format m1_2 12.;
m1_2=input(m2,12.);
run;

data price_changel; set price_changel;
format m1_3 12.;
m1_3=input(m3,12.);
run;

data price_changel; set price_changel;
format m1_4 12.;
m1_4=input(m4,12.);
run;

data price_changel; set price_changel;
format m1_5 12.;
m1_5=input(m5,12.);
run;

data price_changel; set price_changel;
format m1_6 12.;
m1_6=input(m6,12.);
run;

data price_changel; set price_changel;
format m1_7 12.;
m1_7=input(m7,12.);
run;

data price_changel; set price_changel;
format m1_8 12.;
m1_8=input(m8,12.);
run;

data price_changel; set price_changel;
format m1_9 12.;
m1_9=input(m9,12.);
run;

data price_changel; set price_changel;
format m1_10 12.;
m1_10=input(m10,12.);
run;

data price_changel; set price_changel;
format m1_11 12.;
m1_11=input(m11,12.);
run;

data price_changel; set price_changel;
format m1_12 12.;
m1_12=input(m12,12.);
run;

data price_changel; set price_changel;
drop m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12;
run;

data price_changel; set price_changel;
rename m1_1=m1 m1_2=m2 m1_3=m3 m1_4=m4 m1_5=m5 m1_6=m6 m1_7=m7 m1_8=m8 m1_9=m9 m1_10=m10 m1_11=m11 m1_12=m12;
run;

data c.price_change; set price_changel; run;

















data x; set c.Price_change; run;

data diff_x; set x;
array a (12) m1-m12;
array d (11);
do n=1 to 11;
d(n)=a(n+1)-a(n);
end;
run;
